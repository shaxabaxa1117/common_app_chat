import 'package:common_app_chat/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:common_app_chat/providers/auth_provider.dart';
import 'package:common_app_chat/generated/l10n.dart';

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
    final localeProvider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).registerTitle),
      actions: [
        DropdownButton<Locale>(
              value: localeProvider.locale,
              onChanged: (locale) {
                if (locale != null) {
                  localeProvider.setLocale(locale);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('ru'),
                  child: Text('Русский'),
                ),
              ],
            ),
      ],),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration:
                  InputDecoration(labelText: S.of(context).usernameHint),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: S.of(context).gmailHint),
            ),
            TextField(
              controller: passwordController,
              decoration:
                  InputDecoration(labelText: S.of(context).passwordHint),
              obscureText: true,
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: S.of(context).phoneHint),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await authProvider.register(
                    emailController.text,
                    passwordController.text,
                    usernameController.text,
                    phoneNumber: phoneController.text.isNotEmpty
                        ? phoneController.text
                        : null,
                  );

                  if (context.mounted) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                } catch (e) {
                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(S.of(context).errorTitle),
                        content: Text(e.toString()),
                      ),
                    );
                  }
                }
              },
              child: Text(S.of(context).registerButton),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onTap,
              child: Text(
                S.of(context).alreadyHaveAccount,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
