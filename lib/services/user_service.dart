import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

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
}
