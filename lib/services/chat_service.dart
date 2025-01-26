import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //! Создает новый чат или возвращает существующий
  Future<String> startChat(String currentUserId, String friendId) async {
    final chatQuery = await _firestore
        .collection('chats')
        .where('participants', arrayContains: currentUserId)
        .get();

    //! Проверяем, есть ли уже чат с данным другом
    for (var chat in chatQuery.docs) {
      final participants = List<String>.from(chat['participants']);
      if (participants.contains(friendId)) {
        return chat.id; //! Возвращаем существующий чат
      }
    }

    //! Создаем новый чат
    final chatDoc = await _firestore.collection('chats').add({
      'participants': [currentUserId, friendId],
      'createdAt': FieldValue.serverTimestamp(),
    });

    return chatDoc.id;
  }

  //! Получает поток сообщений для чата
Stream<List<Map<String, dynamic>>> getChatMessages(String chatId) {
  return _firestore
      .collection('chats')
      .doc(chatId)
      .collection('messages')
      .orderBy('timestamp', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            return {
              'messageId': doc.id, // Добавлено для удаления сообщения
              'senderId': data['senderId'],
              'senderName': data['senderName'],
              'content': data['content'],
              'timestamp': data['timestamp'],
            };
          }).toList());
}


  //! Отправляет сообщение в чат
  Future<void> sendMessage(
    String chatId,
    String senderId,
    String content,
  ) async {
    // Получаем имя отправителя
    final senderDoc = await _firestore.collection('users').doc(senderId).get();
    final senderName = senderDoc.data()?['username'] ?? 'Unknown';

    // Сохраняем сообщение в Firestore
    final message = {
      'senderId': senderId,
      'senderName': senderName,
      'content': content,
      'timestamp': FieldValue.serverTimestamp(),
    };

    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message);

    // Получаем участников чата
    final chatDoc = await _firestore.collection('chats').doc(chatId).get();
    final participants = chatDoc.data()?['participants'] as List<dynamic>? ?? [];

    // Отправляем уведомления другим участникам
    for (final participantId in participants) {
      if (participantId != senderId) {
        await _sendNotification(participantId, senderName, content);
      }
    }
  }

  //! Отправка уведомления через FCM
  Future<void> _sendNotification(
      String receiverId, String senderName, String content) async {
    //! Получаем токен FCM получателя
    final userDoc = await _firestore.collection('users').doc(receiverId).get();
    final fcmToken = userDoc.data()?['fcmToken'];

    if (fcmToken != null) {
      //! Формируем уведомление
      await FirebaseMessaging.instance.sendMessage(
        to: fcmToken,
        data: {
          'title': 'Новое сообщение',
          'body': '$senderName: $content',
        },
      );
    }
  }
}

