
import 'package:common_app_chat/models/user_model.dart';
import 'package:common_app_chat/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserService _userService = UserService();





  //! Registration
  Future<void> registerUser({
    required String email,
    required String password,
    required String username,
    String? phoneNumber,
  }) async {
    // Создание пользователя в Firebase Authentication
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    //! UID 
    String userId = result.user!.uid;

    // Создаём модель пользователя
    UserModel user = UserModel(
      id: userId,
      username: username,
      email: email,
      phoneNumber: phoneNumber,
    );

    //! Saving the user in firestore
    await _userService.saveUser(user);
  }

  Future<UserCredential> signInWithEmailPassword(
      String email, dynamic password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }



  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }








}
