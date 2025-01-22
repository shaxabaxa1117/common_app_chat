import 'package:common_app_chat/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:common_app_chat/providers/friend_requests_provider.dart';

class FriendRequestsPage extends StatefulWidget {
  const FriendRequestsPage({super.key});

  @override
  State<FriendRequestsPage> createState() => _FriendRequestsPageState();
}

class _FriendRequestsPageState extends State<FriendRequestsPage> {
  @override
  void initState() {
    super.initState();
    final friendRequestsProvider =
        Provider.of<FriendRequestsProvider>(context, listen: false);
    friendRequestsProvider.loadFriendRequests();
  }

@override
Widget build(BuildContext context) {
  final friendRequestsProvider = Provider.of<FriendRequestsProvider>(context);

  return Scaffold(
    appBar: AppBar(
      title: Text(S.of(context).friendRequestsTitle),
    ),
    body: friendRequestsProvider.isLoading
        ? const Center(child: CircularProgressIndicator())
        : friendRequestsProvider.requests.isEmpty
            ? Center(child: Text(S.of(context).noRequests))
            : ListView.builder(
                itemCount: friendRequestsProvider.requests.length,
                itemBuilder: (context, index) {
                  final request = friendRequestsProvider.requests[index];
                  return ListTile(
                    title: Text(
                      S.of(context).requestFrom(request['fromUsername']),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: () => friendRequestsProvider.acceptRequest(
                            request['id'],
                            request['fromUserId'],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () => friendRequestsProvider.declineRequest(
                            request['id'],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
  );
}
}
