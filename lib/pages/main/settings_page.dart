import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:common_app_chat/providers/locale_provider.dart';
import 'package:common_app_chat/providers/theme_provider.dart';
import 'package:common_app_chat/generated/l10n.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settingsTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).languageTitle,
              
            ),
            const SizedBox(height: 8),
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
            const Divider(),
            SwitchListTile(
              title: Text(S.of(context).themeTitle),
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
            const Divider(),
            SwitchListTile(
              title: Text(S.of(context).notificationsTitle),
              value: true, 
              onChanged: (value) {
              },
            ),
          ],
        ),
      ),
    );
  }
}
