// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome back, you've been missed!`
  String get welcomeMessage {
    return Intl.message(
      'Welcome back, you\'ve been missed!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailHint {
    return Intl.message(
      'Email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHint {
    return Intl.message(
      'Password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Register now`
  String get registerNow {
    return Intl.message(
      'Register now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get errorTitle {
    return Intl.message(
      'Error',
      name: 'errorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registerTitle {
    return Intl.message(
      'Registration',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name/Nickname`
  String get usernameHint {
    return Intl.message(
      'Name/Nickname',
      name: 'usernameHint',
      desc: '',
      args: [],
    );
  }

  /// `Gmail`
  String get gmailHint {
    return Intl.message(
      'Gmail',
      name: 'gmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneHint {
    return Intl.message(
      'Phone number',
      name: 'phoneHint',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerButton {
    return Intl.message(
      'Register',
      name: 'registerButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get alreadyHaveAccount {
    return Intl.message(
      'Sign in',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `User Search`
  String get searchTitle {
    return Intl.message(
      'User Search',
      name: 'searchTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter username`
  String get searchHint {
    return Intl.message(
      'Enter username',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get searchLoading {
    return Intl.message(
      'Loading...',
      name: 'searchLoading',
      desc: '',
      args: [],
    );
  }

  /// `No users found`
  String get searchNotFound {
    return Intl.message(
      'No users found',
      name: 'searchNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Add Friend`
  String get addFriend {
    return Intl.message(
      'Add Friend',
      name: 'addFriend',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get languageTitle {
    return Intl.message(
      'Language',
      name: 'languageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get themeTitle {
    return Intl.message(
      'Dark Mode',
      name: 'themeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enable Notifications`
  String get notificationsTitle {
    return Intl.message(
      'Enable Notifications',
      name: 'notificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Friend Requests`
  String get friendRequestsTitle {
    return Intl.message(
      'Friend Requests',
      name: 'friendRequestsTitle',
      desc: '',
      args: [],
    );
  }

  /// `No incoming requests`
  String get noRequests {
    return Intl.message(
      'No incoming requests',
      name: 'noRequests',
      desc: '',
      args: [],
    );
  }

  /// `Request from: {username}`
  String requestFrom(Object username) {
    return Intl.message(
      'Request from: $username',
      name: 'requestFrom',
      desc: '',
      args: [username],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get decline {
    return Intl.message(
      'Decline',
      name: 'decline',
      desc: '',
      args: [],
    );
  }

  /// `Friend invitations`
  String get drawerFriendInvitations {
    return Intl.message(
      'Friend invitations',
      name: 'drawerFriendInvitations',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get drawerSettings {
    return Intl.message(
      'Settings',
      name: 'drawerSettings',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get drawerLogOut {
    return Intl.message(
      'Log Out',
      name: 'drawerLogOut',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get drawerAbout {
    return Intl.message(
      'About',
      name: 'drawerAbout',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get drawerExit {
    return Intl.message(
      'Exit',
      name: 'drawerExit',
      desc: '',
      args: [],
    );
  }

  /// `Error loading data: {error}`
  String loadingError(Object error) {
    return Intl.message(
      'Error loading data: $error',
      name: 'loadingError',
      desc: '',
      args: [error],
    );
  }

  /// `You have no friends yet`
  String get noFriends {
    return Intl.message(
      'You have no friends yet',
      name: 'noFriends',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Delete all messages?`
  String get deleteAllMessages {
    return Intl.message(
      'Delete all messages?',
      name: 'deleteAllMessages',
      desc: '',
      args: [],
    );
  }

  /// `This will delete all messages in the chat.`
  String get deleteAllMessagesConfirmation {
    return Intl.message(
      'This will delete all messages in the chat.',
      name: 'deleteAllMessagesConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete message?`
  String get deleteMessage {
    return Intl.message(
      'Delete message?',
      name: 'deleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `This will delete the selected message.`
  String get deleteMessageConfirmation {
    return Intl.message(
      'This will delete the selected message.',
      name: 'deleteMessageConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Enter message`
  String get enterMessage {
    return Intl.message(
      'Enter message',
      name: 'enterMessage',
      desc: '',
      args: [],
    );
  }

  /// `No messages yet`
  String get messagesNotAvailable {
    return Intl.message(
      'No messages yet',
      name: 'messagesNotAvailable',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
