import 'package:common_app_chat/pages/chat/chat_papge.dart';
import 'package:common_app_chat/services/auth_service.dart';
import 'package:common_app_chat/services/chat_service.dart';
import 'package:common_app_chat/services/user_service.dart';
import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final UserService _userService = UserService();
  final AuthService _authService = AuthService();
  final ChatService _chatService = ChatService();

  List<Map<String, dynamic>> _friends = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  void _loadFriends() async {
    final currentUser = await _authService.getCurrentUser();
    if (currentUser == null) return;

    final friends = await _userService.getFriends(currentUser.uid);
    setState(() {
      _friends = friends
          .map((friend) => {
                'id': friend.id,
                'username': friend.username,
                'email': friend.email,
              })
          .toList();
      _isLoading = false;
    });
  }

  void _startChat(String friendId) async {
    final currentUser = await _authService.getCurrentUser();
    if (currentUser != null) {
      final chatId = await _chatService.startChat(currentUser.uid, friendId);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(chatId: chatId),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Друзья'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _friends.isEmpty
              ? const Center(child: Text('У вас пока нет друзей'))
              : ListView.builder(
                  itemCount: _friends.length,
                  itemBuilder: (context, index) {
                    final friend = _friends[index];
                    return ListTile(
                      title: Text(friend['username']),
                      subtitle: Text(friend['email']),
                      trailing: IconButton(
                        icon: const Icon(Icons.chat),
                        onPressed: () => _startChat(friend['id']),
                      ),
                    );
                  },
                ),
    );
  }
}
