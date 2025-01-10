import 'package:common_app_chat/services/auth_service.dart';
import 'package:common_app_chat/services/user_service.dart';
import 'package:flutter/material.dart';


class FriendRequestsPage extends StatefulWidget {
  const FriendRequestsPage({Key? key}) : super(key: key);

  @override
  _FriendRequestsPageState createState() => _FriendRequestsPageState();
}

class _FriendRequestsPageState extends State<FriendRequestsPage> {
  final UserService _userService = UserService();
  final AuthService _authService = AuthService();

  List<Map<String, dynamic>> _requests = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFriendRequests();
  }

  void _loadFriendRequests() async { //!
    final currentUser = await _authService.getCurrentUser();


    final requests = await _userService.getFriendRequests(currentUser!.uid);
    setState(() {
      _requests = requests;
      _isLoading = false;
    });
  }

  void _acceptRequest(String requestId, String fromUserId) async {
    final currentUser = await _authService.getCurrentUser();
    final userId = currentUser!.uid;

    await _userService.acceptFriendRequest(requestId, fromUserId, userId);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Запрос принят')),
    );

    _loadFriendRequests(); // Обновить список
  }

  void _declineRequest(String requestId) async {
    await _userService.declineFriendRequest(requestId);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Запрос отклонён')),
    );

    _loadFriendRequests(); // Обновить список
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Запросы в друзья'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _requests.isEmpty
              ? const Center(child: Text('Нет входящих запросов'))
              : ListView.builder(
                  itemCount: _requests.length,
                  itemBuilder: (context, index) {
                    final request = _requests[index];
                    return ListTile(
                      title: Text('Запрос от: ${request['fromUserId']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check, color: Colors.green),
                            onPressed: () => _acceptRequest(
                              request['id'],
                              request['fromUserId'],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.red),
                            onPressed: () => _declineRequest(request['id']),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
