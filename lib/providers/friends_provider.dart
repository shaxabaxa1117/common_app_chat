import 'package:common_app_chat/pages/chat/chat_papge.dart';
import 'package:flutter/material.dart';
import 'package:common_app_chat/services/auth_service.dart';
import 'package:common_app_chat/services/user_service.dart';
import 'package:common_app_chat/services/chat_service.dart';

class FriendsProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();
  final ChatService _chatService = ChatService();

  Stream<List<Map<String, dynamic>>>? _friendsStream;

  Stream<List<Map<String, dynamic>>>? get friendsStream => _friendsStream;

  Future<void> loadFriends() async {
    final currentUser = await _authService.getCurrentUser();
    if (currentUser != null) {
      _friendsStream = _userService.getFriendsStream(currentUser.uid);
      notifyListeners();
    }
  }

  Future<void> startChat(BuildContext context, String friendId) async {
    final currentUser = await _authService.getCurrentUser();
    if (currentUser != null) {
      final chatId = await _chatService.startChat(currentUser.uid, friendId);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(chatId: chatId),));
    }
  }

  Future<void> removeFriend(String friendId) async {
    final currentUser = await _authService.getCurrentUser();
    if (currentUser != null) {
      await _userService.removeFriend(currentUser.uid, friendId);
      notifyListeners();
    }
  }
}
