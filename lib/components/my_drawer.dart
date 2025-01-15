import 'dart:io';

import 'package:common_app_chat/components/my_drawer_listtile.dart';
import 'package:common_app_chat/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

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
          Expanded(
              child: Column(
            children: [

              MyListTile(
                  icon: Icons.groups, text: 'Create group', onTap: () {}),
              MyListTile(
                  icon: Icons.message,
                  text: 'Friend invitations',
                  onTap: () {
                    Navigator.pushNamed(context, '/request');
                  }),
              MyListTile(icon: Icons.settings, text: 'Settings', onTap: () {}),
              MyListTile(
                icon: Icons.logout,
                text: 'Log Out',
                onTap: () async {
                  try {
                    await _auth.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login', // Заменить на маршрут для экрана входа
                      (route) => false,
                    );
                  } catch (e) {
                    // Вывод ошибки, если что-то пошло не так
                    print('Ошибка при выходе: $e');
                  }
                },
              ),
              MyListTile(icon: Icons.info, text: 'About', onTap: () {}),
              Spacer(),
              MyListTile(
                  icon: Icons.exit_to_app,
                  text: 'Exit',
                  onTap: () {
                    exit(0);
                  }),
              SizedBox(
                height: 10,
              )
            ],
          ))
        ],
      ),
    );
  }
}
