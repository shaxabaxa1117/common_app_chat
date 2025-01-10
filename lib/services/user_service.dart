import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference friendRequests =
      FirebaseFirestore.instance.collection('friend_requests');

  // Сохранение пользователя в Firestore
  Future<void> saveUser(UserModel user) async {
    await userCollection.doc(user.id).set(user.toMap());
  }

  // Получение данных пользователя
  Future<UserModel?> getUser(String userId) async {
    DocumentSnapshot snapshot = await userCollection.doc(userId).get();
    if (snapshot.exists) {
      return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    }
    return null;
  }

  // Поиск пользователей
  Future<List<UserModel>> searchUsers(String query) async {
    final snapshot = await userCollection
        .where('username', isEqualTo: query)
        .get();

    return snapshot.docs
        .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // Отправка заявки в друзья
  Future<void> sendFriendRequest(String fromUserId, String toUserId) async {
    await friendRequests.add({
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'status': 'pending',
    });
  }

  // Принятие заявки в друзья
  Future<void> acceptFriendRequest(
      String requestId, String fromUserId, String toUserId) async {
    await friendRequests.doc(requestId).update({'status': 'accepted'});

    await userCollection.doc(fromUserId).update({
      'friends': FieldValue.arrayUnion([toUserId]),
    });

    await userCollection.doc(toUserId).update({
      'friends': FieldValue.arrayUnion([fromUserId]),
    });
  }

  // Получение друзей пользователя
  Future<List<UserModel>> getFriends(String userId) async {
    final userDoc = await userCollection.doc(userId).get();
    final user = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);

    final friendsSnapshots = await userCollection
        .where(FieldPath.documentId, whereIn: user.friends)
        .get();

    return friendsSnapshots.docs
        .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
