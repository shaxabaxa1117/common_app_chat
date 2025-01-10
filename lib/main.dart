import 'package:common_app_chat/app.dart';
import 'package:common_app_chat/pages/auth/logIn_page.dart';
import 'package:common_app_chat/config/theme/theme.dart';
import 'package:common_app_chat/pages/chat/home_page.dart';
import 'package:common_app_chat/utils/consts/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home' : (context) => const HomePage(),
        
      },
        title: 'Flutter Demo', theme: lightTheme, home: const MainAppWidget());
  }
}
