import 'package:common_app_chat/components/my_drawer.dart';
import 'package:common_app_chat/pages/main/friend_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:common_app_chat/providers/locale_provider.dart';
import 'package:common_app_chat/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CommonApp'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              icon: const Icon(Icons.group_add)),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'en') {
                localeProvider.setLocale(const Locale('en'));
              } else if (value == 'ru') {
                localeProvider.setLocale(const Locale('ru'));
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              PopupMenuItem(
                value: 'ru',
                child: Text('Русский'),
              ),
            ],
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: FriendsPage(),
    );
  }
}
