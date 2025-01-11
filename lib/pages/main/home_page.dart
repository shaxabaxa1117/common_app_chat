import 'package:common_app_chat/components/my_drawer.dart';
import 'package:common_app_chat/pages/main/friend_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('CommonChat'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){


            Navigator.pushNamed(context, '/friends');
          }, icon: const Icon(Icons.people)),
        ],

      ),
      drawer: MyDrawer(),
      body: FriendsPage(),
    );
  }
}