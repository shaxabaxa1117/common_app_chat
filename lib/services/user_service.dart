import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference friendRequests =
      FirebaseFirestore.instance.collection('friend_requests');

  //! Сохранение пользователя в Firestore
  Future<void> saveUser(UserModel user) async {
    await userCollection.doc(user.id).set(user.toMap());
  }

  //! Получение данных пользователя
  Future<UserModel?> getUser(String userId) async {
    DocumentSnapshot snapshot = await userCollection.doc(userId).get();
    if (snapshot.exists) {
      return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    }
    return null;
  }

  //! Поиск пользователей
  Future<List<UserModel>> searchUsers(String userName) async {
    final snapshot =
        await userCollection.where('username', isEqualTo: userName).get();

    return snapshot.docs
        .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

/* ------------------------------------------------------------------------------------*/
  //! Получение друзей пользователя
//! Получение друзей пользователя через Stream
  Stream<List<Map<String, dynamic>>> getFriendsStream(String userId) {
    return userCollection
        .doc(userId)
        .snapshots()
        .asyncMap((userSnapshot) async {
      if (!userSnapshot.exists || userSnapshot.data() == null) {
        return [];
      }

      final user =
          UserModel.fromMap(userSnapshot.data() as Map<String, dynamic>);
      if (user.friends == null || user.friends.isEmpty) {
        return [];
      }

      final friendsSnapshots = await userCollection
          .where(FieldPath.documentId, whereIn: user.friends)
          .get();

      return friendsSnapshots.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return {
          'id': doc.id,
          'username': data['username'],
          'email': data['email'],
        };
      }).toList();
    });
  }

  //! Отправка заявки в друзья
  Future<void> sendFriendRequest(String fromUserId, String toUserId) async {
    await friendRequests.add({
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'status': 'pending',
    });
  }

//! Работа с запросами на дружбу
  Future<List<Map<String, dynamic>>> getFriendRequests(String userId) async {
    final snapshot = await friendRequests
        .where('toUserId',
            isEqualTo:
                userId) //! Ищем запросы, адресованные текущему пользователю
        .where('status', isEqualTo: 'pending') //! Только активные запросы
        .get();

    List<Map<String, dynamic>> requests = [];

    for (var doc in snapshot.docs) {
      //! Получаем данные отправителя
      final fromUserId = doc['fromUserId'];
      final userSnapshot = await userCollection.doc(fromUserId).get();
      final userData = userSnapshot.data() as Map<String, dynamic>?;

      requests.add({
        'id': doc.id,
        'fromUserId': fromUserId,
        'fromUsername': userData?['username'] ?? 'Unknown',
        'toUserId': doc['toUserId'],
        'status': doc['status'],
      });
    }

    return requests;
  }

  Future<void> acceptFriendRequest(
      String requestId, String fromUserId, String toUserId) async {
    final CollectionReference friendRequests =
        FirebaseFirestore.instance.collection('friend_requests');

    //! Обновить статус заявки
    await friendRequests.doc(requestId).update({'status': 'accepted'});

    //! Добавить пользователей друг к другу в друзья
    await FirebaseFirestore.instance
        .collection('users')
        .doc(fromUserId)
        .update({
      'friends': FieldValue.arrayUnion([toUserId]),
    });

    await FirebaseFirestore.instance.collection('users').doc(toUserId).update({
      'friends': FieldValue.arrayUnion([fromUserId]),
    });
  }

  Future<void> declineFriendRequest(String requestId) async {
    await FirebaseFirestore.instance
        .collection('friend_requests')
        .doc(requestId)
        .update({'status': 'declined'});
  }

  Future<void> removeFriend(String userId, String friendId) async {
    //! Удаляем друга из списка пользователя
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'friends': FieldValue.arrayRemove([friendId]),
    });

    //! Удаляем пользователя из списка друга
    await FirebaseFirestore.instance.collection('users').doc(friendId).update({
      'friends': FieldValue.arrayRemove([userId]),
    });
  }
}
