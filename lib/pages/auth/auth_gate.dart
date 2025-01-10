import 'package:common_app_chat/pages/auth/login_or_register.dart';
import 'package:common_app_chat/pages/chat/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {

        if (snapshot.hasData) {
          return HomePage();
        }else{

return const LoginOrRegister();

        }


          
     
      },
    );
  }
}
