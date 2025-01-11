import 'package:common_app_chat/models/user_model.dart';
import 'package:common_app_chat/services/auth_service.dart';
import 'package:common_app_chat/services/user_service.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final UserService _userService = UserService();
  final AuthService _authService = AuthService();

  List<UserModel> _searchResults = [];
  bool _isLoading = false;

  void _searchUsers() async {
    if (_searchController.text.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final currentUser = await _authService.getCurrentUser();
      final userId = currentUser!.uid;
      final currentUserData = await _userService.getUser(userId);

      if (currentUserData != null && currentUserData.username == _searchController.text) {
        setState(() {
          _searchResults = [];
          _isLoading = false;
        });
        return;
      }

      List<UserModel> results = await _userService.searchUsers(_searchController.text);
      setState(() {
        _searchResults = results;
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка поиска: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _sendFriendRequest(String toUserId) async {
    final currentUser = await _authService.getCurrentUser();
    final userId = currentUser!.uid;

    try {
      await _userService.sendFriendRequest(userId, toUserId);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Запрос отправлен!')),
      );

      // Удаляем пользователя из списка
      setState(() {
        _searchResults.removeWhere((user) => user.id == toUserId);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка отправки запроса: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поиск пользователей'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Введите имя пользователя',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchUsers,
                ),
              ],
            ),
          ),
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (_searchResults.isEmpty)
            const Expanded(
              child: Center(child: Text('Пользователи не найдены')),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final user = _searchResults[index];
                  return ListTile(
                    title: Text(user.username),
                    subtitle: Text(user.email),
                    trailing: IconButton(
                      icon: const Icon(Icons.person_add),
                      onPressed: () => _sendFriendRequest(user.id),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
