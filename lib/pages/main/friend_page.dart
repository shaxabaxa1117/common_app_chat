import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:common_app_chat/providers/friends_provider.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  void initState() {
    super.initState();
    final friendsProvider =
        Provider.of<FriendsProvider>(context, listen: false);
    friendsProvider.loadFriends();
  }

  @override
  Widget build(BuildContext context) {
    final friendsProvider = Provider.of<FriendsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Друзья'),
      ),
      body: friendsProvider.friendsStream == null
          ? const Center(child: CircularProgressIndicator())
          : StreamBuilder<List<Map<String, dynamic>>>(
              stream: friendsProvider.friendsStream,
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
                      onTap: () =>
                          friendsProvider.startChat(context, friend['id']),
                      title: Text(friend['username']),
                      subtitle: Text(friend['email']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () =>
                            friendsProvider.removeFriend(friend['id']),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
