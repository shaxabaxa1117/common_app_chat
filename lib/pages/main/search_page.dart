import 'package:common_app_chat/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:common_app_chat/generated/l10n.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).searchTitle),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchProvider.searchController,
                    decoration: InputDecoration(
                      hintText: S.of(context).searchHint,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => searchProvider.searchUsers(context),
                ),
              ],
            ),
          ),
          if (searchProvider.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (searchProvider.searchResults.isEmpty)
            Expanded(
              child: Center(child: Text(S.of(context).searchNotFound)),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: searchProvider.searchResults.length,
                itemBuilder: (context, index) {
                  final user = searchProvider.searchResults[index];
                  return ListTile(
                    title: Text(user.username),
                    subtitle: Text(user.email),
                    trailing: IconButton(
                      icon: const Icon(Icons.person_add),
                      onPressed: () =>
                          searchProvider.sendFriendRequest(user.id, context),
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
