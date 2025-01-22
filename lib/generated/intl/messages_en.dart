// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(error) => "Error loading data: ${error}";

  static String m1(username) => "Request from: ${username}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Accept"),
        "addFriend": MessageLookupByLibrary.simpleMessage("Add Friend"),
        "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage("Sign in"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "chat": MessageLookupByLibrary.simpleMessage("Chat"),
        "decline": MessageLookupByLibrary.simpleMessage("Decline"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteAllMessages":
            MessageLookupByLibrary.simpleMessage("Delete all messages?"),
        "deleteAllMessagesConfirmation": MessageLookupByLibrary.simpleMessage(
            "This will delete all messages in the chat."),
        "deleteMessage":
            MessageLookupByLibrary.simpleMessage("Delete message?"),
        "deleteMessageConfirmation": MessageLookupByLibrary.simpleMessage(
            "This will delete the selected message."),
        "drawerAbout": MessageLookupByLibrary.simpleMessage("About"),
        "drawerExit": MessageLookupByLibrary.simpleMessage("Exit"),
        "drawerFriendInvitations":
            MessageLookupByLibrary.simpleMessage("Friend invitations"),
        "drawerLogOut": MessageLookupByLibrary.simpleMessage("Log Out"),
        "drawerSettings": MessageLookupByLibrary.simpleMessage("Settings"),
        "emailHint": MessageLookupByLibrary.simpleMessage("Email"),
        "enterMessage": MessageLookupByLibrary.simpleMessage("Enter message"),
        "errorTitle": MessageLookupByLibrary.simpleMessage("Error"),
        "friendRequestsTitle":
            MessageLookupByLibrary.simpleMessage("Friend Requests"),
        "gmailHint": MessageLookupByLibrary.simpleMessage("Gmail"),
        "languageTitle": MessageLookupByLibrary.simpleMessage("Language"),
        "loadingError": m0,
        "loginButton": MessageLookupByLibrary.simpleMessage("Login"),
        "messagesNotAvailable":
            MessageLookupByLibrary.simpleMessage("No messages yet"),
        "noFriends":
            MessageLookupByLibrary.simpleMessage("You have no friends yet"),
        "noRequests":
            MessageLookupByLibrary.simpleMessage("No incoming requests"),
        "notificationsTitle":
            MessageLookupByLibrary.simpleMessage("Enable Notifications"),
        "passwordHint": MessageLookupByLibrary.simpleMessage("Password"),
        "phoneHint": MessageLookupByLibrary.simpleMessage("Phone number"),
        "registerButton": MessageLookupByLibrary.simpleMessage("Register"),
        "registerNow": MessageLookupByLibrary.simpleMessage("Register now"),
        "registerTitle": MessageLookupByLibrary.simpleMessage("Registration"),
        "requestFrom": m1,
        "searchHint": MessageLookupByLibrary.simpleMessage("Enter username"),
        "searchLoading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "searchNotFound":
            MessageLookupByLibrary.simpleMessage("No users found"),
        "searchTitle": MessageLookupByLibrary.simpleMessage("User Search"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "themeTitle": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "usernameHint": MessageLookupByLibrary.simpleMessage("Name/Nickname"),
        "welcomeMessage": MessageLookupByLibrary.simpleMessage(
            "Welcome back, you\'ve been missed!")
      };
}
