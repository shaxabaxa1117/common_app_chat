import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:common_app_chat/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _currentUser;

  User? get currentUser => _currentUser;




  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await _authService.signInWithEmailPassword(email, password);
      _currentUser = userCredential.user;
      notifyListeners();
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }




  Future<void> register(String email, String password, String username,
      {String? phoneNumber}) async {
    try {
      await _authService.registerUser(
        email: email,
        password: password,
        username: username,
        phoneNumber: phoneNumber,
      );
      _currentUser = await _authService.getCurrentUser();
      notifyListeners();
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }


  

  Future<void> logout() async {
    await _authService.signOut();
    _currentUser = null;
    notifyListeners();
  }

  Future<void> initialize() async {
    _currentUser = await _authService.getCurrentUser();
    notifyListeners();
  }
}
