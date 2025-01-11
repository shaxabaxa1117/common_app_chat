
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Создает новый чат или возвращает существующий
  Future<String> startChat(String currentUserId, String friendId) async {
    final chatQuery = await _firestore
        .collection('chats')
        .where('participants', arrayContains: currentUserId)
        .get();

    // Проверяем, есть ли уже чат с данным другом
    for (var chat in chatQuery.docs) {
      final participants = List<String>.from(chat['participants']);
      if (participants.contains(friendId)) {
        return chat.id; // Возвращаем существующий чат
      }
    }

    // Создаем новый чат
    final chatDoc = await _firestore.collection('chats').add({
      'participants': [currentUserId, friendId],
      'createdAt': FieldValue.serverTimestamp(),
    });

    return chatDoc.id;
  }

  /// Получает поток сообщений для чата
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
                'senderId': data['senderId'],
                'senderName': data['senderName'],
                'content': data['content'],
                'timestamp': data['timestamp'],
              };
            }).toList());
  }

  /// Отправляет сообщение в чат
  Future<void> sendMessage(
    String chatId,
    String senderId,
    String senderName,
    String content,
  ) async {
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
  }

  /// Получает список чатов текущего пользователя
  Stream<List<Map<String, dynamic>>> getUserChats(String userId) {
    return _firestore
        .collection('chats')
        .where('participants', arrayContains: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final data = doc.data();
              return {
                'chatId': doc.id,
                'participants': data['participants'],
                'createdAt': data['createdAt'],
              };
            }).toList());
  }
}
