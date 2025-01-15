import 'package:common_app_chat/models/user_model.dart';
import 'package:common_app_chat/services/auth_service.dart';
import 'package:common_app_chat/services/user_service.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  final UserService _userService = UserService();
  final AuthService _authService = AuthService();

  List<UserModel> _searchResults = [];
  bool _isLoading = false;

  TextEditingController get searchController => _searchController;
  List<UserModel> get searchResults => _searchResults;
  bool get isLoading => _isLoading;

  void searchUsers(BuildContext context) async {
    if (_searchController.text.isEmpty) return;

    _isLoading = true;
    notifyListeners();

    try {
      final currentUser = await _authService.getCurrentUser();
      final userId = currentUser!.uid;
      final currentUserData = await _userService.getUser(userId);

      if (currentUserData != null &&
          currentUserData.username == _searchController.text) {
        _searchResults = [];
        _isLoading = false;
        notifyListeners();
        return;
      }

      List<UserModel> results =
          await _userService.searchUsers(_searchController.text);

      _searchResults = results;
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка поиска: $e')),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void sendFriendRequest(String toUserId, BuildContext context) async {
    final currentUser = await _authService.getCurrentUser();
    final userId = currentUser!.uid;

    try {
      await _userService.sendFriendRequest(userId, toUserId);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Запрос отправлен!')),
      );

      _searchResults.removeWhere((user) => user.id == toUserId);
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка отправки запроса: $e')),
      );
    }
  }
}
