import 'package:common_app_chat/app.dart';
import 'package:common_app_chat/pages/auth/auth_gate.dart';
import 'package:common_app_chat/config/theme/theme.dart';
import 'package:common_app_chat/pages/main/friend_page.dart';
import 'package:common_app_chat/pages/main/friend_requests_page.dart';
import 'package:common_app_chat/pages/main/home_page.dart';
import 'package:common_app_chat/pages/main/search_page.dart';
import 'package:common_app_chat/providers/auth_provider.dart';
import 'package:common_app_chat/providers/chat_prvider.dart';
import 'package:common_app_chat/providers/friend_requests_provider.dart';
import 'package:common_app_chat/providers/friends_provider.dart';
import 'package:common_app_chat/providers/search_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => FriendRequestsProvider()),
        ChangeNotifierProvider(create: (context) => FriendsProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomePage(),
        '/search': (context) =>  SearchPage(),
        '/request': (context) => const FriendRequestsPage(),
        '/friends': (context) => const FriendsPage(),
        '/login': (context) => const AuthGate(),
      },
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const MainAppWidget(),
    );
  }
}
