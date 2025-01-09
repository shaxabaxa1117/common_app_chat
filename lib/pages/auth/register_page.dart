import 'package:common_app_chat/components/my_button.dart';
import 'package:common_app_chat/components/my_textfield.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  void Function()? onTap;

  void register({required BuildContext context}) async {


  //   if (_passwordController.text == _confirmController.text) {
  //     try {
  //       await auth.signUpWithEmailPassword(
  //           _emailController.text, _passwordController.text);
  //     } catch (e) {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             title: Text(e.toString()),
  //           );
  //         },
  //       );
  //     }
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const AlertDialog(
  //           title: Text('Passwords don`t match'),
  //         );
  //       },
  //     );
  //   }
  }
  

  RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Let`s create account for you',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          MyTextfield(
            hintText: 'Email',
            isObseureText: false,
            controller: _emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextfield(
            hintText: 'Password',
            isObseureText: true,
            controller: _passwordController,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextfield(
            hintText: 'Confirm password',
            isObseureText: true,
            controller: _confirmController,
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            text: 'Register',
            onTap: () => register(context: context),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'Login now',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


