import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:common_app_chat/providers/auth_provider.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Регистрация')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Имя/Никнейм'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Gmail'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Пароль'),
              obscureText: true,
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Номер телефона'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Сохраняем текущий контекст


                try {
                  await authProvider.register(
                    emailController.text,
                    passwordController.text,
                    usernameController.text,
                    phoneNumber: phoneController.text.isNotEmpty
                        ? phoneController.text
                        : null,
                  );

                  // Навигация в случае успеха
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                } catch (e) {
                  // Показываем ошибку в сохранённом контексте
                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Ошибка'),
                        content: Text(e.toString()),
                      ),
                    );
                  }
                }
              },
              child: const Text('Зарегистрироваться'),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onTap,
              child: const Text(
                'Войти',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
