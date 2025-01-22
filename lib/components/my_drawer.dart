import 'dart:io';

import 'package:common_app_chat/components/my_drawer_listtile.dart';
import 'package:common_app_chat/generated/l10n.dart';
import 'package:common_app_chat/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
  children: [
              Container(
              height: 250,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/drawer_anim.json',
              )),
    MyListTile(
      icon: Icons.message,
      text: S.of(context).drawerFriendInvitations,
      onTap: () {
        Navigator.pushNamed(context, '/request');
      },
    ),
    MyListTile(
      icon: Icons.settings,
      text: S.of(context).drawerSettings,
      onTap: () {
        Navigator.pushNamed(context, '/settings');
      },
    ),
    MyListTile(
      icon: Icons.logout,
      text: S.of(context).drawerLogOut,
      onTap: () async {
        try {
          await _auth.signOut();
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/login',
            (route) => false,
          );
        } catch (e) {
          print('Ошибка при выходе: $e');
        }
      },
    ),
    MyListTile(
      icon: Icons.info,
      text: S.of(context).drawerAbout,
      onTap: () {},
    ),
    Spacer(),
    MyListTile(
      icon: Icons.exit_to_app,
      text: S.of(context).drawerExit,
      onTap: () {
        exit(0);
      },
    ),
    const SizedBox(height: 10),
  ],
)

    );
  }
}
