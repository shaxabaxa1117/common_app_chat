import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:common_app_chat/providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

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
          const SizedBox(height: 20),
          Text(
            'Welcome back, you\'ve been missed!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(hintText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              try {
                await authProvider.login(
                  _emailController.text,
                  _passwordController.text,
                );
                Navigator.pushReplacementNamed(context, '/home');
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: Text(e.toString()),
                  ),
                );
              }
            },
            child: const Text('Login'),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: onTap,
            child: const Text(
              'Register now',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
