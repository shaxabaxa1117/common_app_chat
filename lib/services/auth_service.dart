import 'package:common_app_chat/models/user_model.dart';
import 'package:common_app_chat/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserService _userService = UserService();

  Future<User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  //! Registration
Future<void> registerUser({
  required String email,
  required String password,
  required String username,
  String? phoneNumber,
}) async {
  if (email.isEmpty || password.isEmpty || username.isEmpty) {
    throw Exception('Все поля обязательны для заполнения');
  }

  if (password.length < 6) {
    throw Exception('Пароль должен содержать минимум 6 символов');
  }

  //! Создание пользователя в Firebase Authentication
  UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  //! UID
  String userId = result.user!.uid;

  //! Обновляем displayName
  await result.user!.updateDisplayName(username);
  await result.user!.reload(); // Обновляем данные пользователя локально

  //! Сохраняем пользователя в Firestore
  UserModel user = UserModel(
    id: userId,
    username: username,
    email: email,
    phoneNumber: phoneNumber,
    friends: [],
  );

  await _userService.saveUser(user);
}


  Future<UserCredential> signInWithEmailPassword(
      String email, dynamic password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
