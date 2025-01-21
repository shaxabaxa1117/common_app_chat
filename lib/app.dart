import 'package:common_app_chat/pages/auth/auth_gate.dart';
import 'package:common_app_chat/pages/auth/logIn_page.dart';
import 'package:common_app_chat/pages/auth/register_page.dart';
import 'package:flutter/material.dart';

class MainAppWidget extends StatelessWidget {
  const MainAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthGate();
  }
}