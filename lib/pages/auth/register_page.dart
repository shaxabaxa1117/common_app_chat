import 'package:common_app_chat/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  void Function()? onTap;
  final AuthService _authService = AuthService();
  RegisterPage({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Имя/Никнейм'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Gmail'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Пароль'),
              obscureText: true,
            ),
            TextField(
              controller: phoneController,
              decoration:
                  InputDecoration(labelText: 'Номер телефона (опционально)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _authService.registerUser(
                    email: emailController.text,
                    password: passwordController.text,
                    username: usernameController.text,
                    phoneNumber: phoneController.text.isNotEmpty
                        ? phoneController.text
                        : null,
                  );

                  // Навигация после успешной регистрации
                  Navigator.pushReplacementNamed(context, '/home');
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Зарегистрироваться'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Есть аккаунт?',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Войти',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
