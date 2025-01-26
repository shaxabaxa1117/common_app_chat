import 'package:common_app_chat/app.dart';
import 'package:common_app_chat/generated/l10n.dart';
import 'package:common_app_chat/pages/auth/auth_gate.dart';
import 'package:common_app_chat/config/theme/theme.dart';
import 'package:common_app_chat/pages/main/friend_page.dart';
import 'package:common_app_chat/pages/main/friend_requests_page.dart';
import 'package:common_app_chat/pages/main/home_page.dart';
import 'package:common_app_chat/pages/main/search_page.dart';
import 'package:common_app_chat/pages/main/settings_page.dart';
import 'package:common_app_chat/providers/auth_provider.dart';
import 'package:common_app_chat/providers/chat_prvider.dart';
import 'package:common_app_chat/providers/friend_requests_provider.dart';
import 'package:common_app_chat/providers/friends_provider.dart';
import 'package:common_app_chat/providers/locale_provider.dart';
import 'package:common_app_chat/providers/search_provider.dart';
import 'package:common_app_chat/providers/theme_provider.dart';
import 'package:common_app_chat/services/auth_service.dart';
import 'package:common_app_chat/services/fcm_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  await FcmService().init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => FriendRequestsProvider()),
        ChangeNotifierProvider(create: (context) => FriendsProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final localeProvider = Provider.of<LocaleProvider>(context);
     final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomePage(),
        '/search': (context) =>  const SearchPage(),
        '/request': (context) => const FriendRequestsPage(),
        '/friends': (context) => const FriendsPage(),
        '/login': (context) => const AuthGate(),
        '/settings': (context) => const SettingsPage(),

      },

         localizationsDelegates: const [
        S.delegate, //! Генерированный класс для переводов
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: localeProvider.locale, 
      title: 'Flutter Demo',
      theme:  themeProvider.isDarkMode ? darkTheme : lightTheme,
      home: const MainAppWidget(),
    );
  }
}
