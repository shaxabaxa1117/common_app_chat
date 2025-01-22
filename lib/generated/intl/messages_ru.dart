// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(error) => "Ошибка загрузки данных: ${error}";

  static String m1(username) => "Запрос от: ${username}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Принять"),
        "addFriend": MessageLookupByLibrary.simpleMessage("Добавить в друзья"),
        "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage("Войти"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "chat": MessageLookupByLibrary.simpleMessage("Чат"),
        "decline": MessageLookupByLibrary.simpleMessage("Отклонить"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "deleteAllMessages":
            MessageLookupByLibrary.simpleMessage("Удалить все сообщения?"),
        "deleteAllMessagesConfirmation": MessageLookupByLibrary.simpleMessage(
            "Это действие удалит все сообщения в чате."),
        "deleteMessage":
            MessageLookupByLibrary.simpleMessage("Удалить сообщение?"),
        "deleteMessageConfirmation": MessageLookupByLibrary.simpleMessage(
            "Это действие удалит выбранное сообщение."),
        "drawerAbout": MessageLookupByLibrary.simpleMessage("О приложении"),
        "drawerExit": MessageLookupByLibrary.simpleMessage("Выход"),
        "drawerFriendInvitations":
            MessageLookupByLibrary.simpleMessage("Запросы в друзья"),
        "drawerLogOut": MessageLookupByLibrary.simpleMessage("Выйти"),
        "drawerSettings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "emailHint": MessageLookupByLibrary.simpleMessage("Электронная почта"),
        "enterMessage":
            MessageLookupByLibrary.simpleMessage("Введите сообщение"),
        "errorTitle": MessageLookupByLibrary.simpleMessage("Ошибка"),
        "friendRequestsTitle":
            MessageLookupByLibrary.simpleMessage("Запросы в друзья"),
        "gmailHint": MessageLookupByLibrary.simpleMessage("Gmail"),
        "languageTitle": MessageLookupByLibrary.simpleMessage("Язык"),
        "loadingError": m0,
        "loginButton": MessageLookupByLibrary.simpleMessage("Войти"),
        "messagesNotAvailable":
            MessageLookupByLibrary.simpleMessage("Сообщений пока нет"),
        "noFriends":
            MessageLookupByLibrary.simpleMessage("У вас пока нет друзей"),
        "noRequests":
            MessageLookupByLibrary.simpleMessage("Нет входящих запросов"),
        "notificationsTitle":
            MessageLookupByLibrary.simpleMessage("Включить уведомления"),
        "passwordHint": MessageLookupByLibrary.simpleMessage("Пароль"),
        "phoneHint": MessageLookupByLibrary.simpleMessage("Номер телефона"),
        "registerButton":
            MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "registerNow":
            MessageLookupByLibrary.simpleMessage("Зарегистрироваться сейчас"),
        "registerTitle": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "requestFrom": m1,
        "searchHint":
            MessageLookupByLibrary.simpleMessage("Введите имя пользователя"),
        "searchLoading": MessageLookupByLibrary.simpleMessage("Загрузка..."),
        "searchNotFound":
            MessageLookupByLibrary.simpleMessage("Пользователи не найдены"),
        "searchTitle":
            MessageLookupByLibrary.simpleMessage("Поиск пользователей"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Настройки"),
        "themeTitle": MessageLookupByLibrary.simpleMessage("Темная тема"),
        "usernameHint": MessageLookupByLibrary.simpleMessage("Имя/Никнейм"),
        "welcomeMessage":
            MessageLookupByLibrary.simpleMessage("С возвращением, мы скучали!")
      };
}
