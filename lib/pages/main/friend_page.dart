import 'package:common_app_chat/pages/chat/chat_papge.dart';
import 'package:common_app_chat/services/auth_service.dart';
import 'package:common_app_chat/services/chat_service.dart';
import 'package:common_app_chat/services/user_service.dart';
import 'package:flutter/material.dart';

import 'package:common_app_chat/pages/chat/chat_papge.dart';
import 'package:common_app_chat/services/auth_service.dart';
import 'package:common_app_chat/services/user_service.dart';
import 'package:common_app_chat/services/chat_service.dart';
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

  Stream<List<Map<String, dynamic>>>? _friendsStream;

  @override
  void initState() {
    super.initState();
    _setupFriendsStream();
  }

  void _setupFriendsStream() async {
    final currentUser = await _authService.getCurrentUser();
    if (currentUser != null) {
      setState(() {
        _friendsStream = _userService.getFriendsStream(currentUser.uid);
      });
    }
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
      body: _friendsStream == null
          ? const Center(child: CircularProgressIndicator())
          : StreamBuilder<List<Map<String, dynamic>>>(
              stream: _friendsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Ошибка загрузки данных: ${snapshot.error}'),
                  );
                }

                final friends = snapshot.data ?? [];

                if (friends.isEmpty) {
                  return const Center(child: Text('У вас пока нет друзей'));
                }

                return ListView.builder(
                  itemCount: friends.length,
                  itemBuilder: (context, index) {
                    final friend = friends[index];
                    return ListTile(
                      onTap: () => _startChat(friend['id']),
                      title: Text(friend['username']),
                      subtitle: Text(friend['email']),

                    );
                  },
                );
              },
            ),
    );
  }
}
