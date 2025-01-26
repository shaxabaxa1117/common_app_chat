
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService{

FirebaseMessaging messaging = FirebaseMessaging.instance;

Future<void> init() async {
  NotificationSettings settings = await messaging.requestPermission();
  print('User granted permission: ${settings.authorizationStatus}');

  final FCMtoken = await messaging.getToken();
  print('FCM Token: $FCMtoken');

}
}
