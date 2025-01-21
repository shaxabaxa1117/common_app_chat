import 'package:flutter/material.dart';
import 'package:common_app_chat/services/auth_service.dart';
import 'package:common_app_chat/services/user_service.dart';

class FriendRequestsProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  List<Map<String, dynamic>> _requests = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get requests => _requests;
  bool get isLoading => _isLoading;

  Future<void> loadFriendRequests() async {
    _isLoading = true;
 

    try {
      final currentUser = await _authService.getCurrentUser();
      if (currentUser != null) {
        _requests = await _userService.getFriendRequests(currentUser.uid);
      }
    } catch (e) {
      _requests = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> acceptRequest(String requestId, String fromUserId) async {
    try {
      final currentUser = await _authService.getCurrentUser();
      if (currentUser != null) {
        await _userService.acceptFriendRequest(
            requestId, fromUserId, currentUser.uid);
        _requests.removeWhere((request) => request['id'] == requestId);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> declineRequest(String requestId) async {
    try {
      await _userService.declineFriendRequest(requestId);
      _requests.removeWhere((request) => request['id'] == requestId);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
