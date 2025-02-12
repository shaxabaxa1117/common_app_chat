// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCeZQH0mHE54DNJRyRh90IMYg6haeOEi8w',
    appId: '1:237388872905:web:750bdfc8dc2d65c6f86118',
    messagingSenderId: '237388872905',
    projectId: 'common-chat-24651',
    authDomain: 'common-chat-24651.firebaseapp.com',
    storageBucket: 'common-chat-24651.firebasestorage.app',
    measurementId: 'G-7QFYGZF239',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJWTrxDBJ6cWnV72dT5YkQSReDuHipL6s',
    appId: '1:237388872905:android:29a4d8d4727f4987f86118',
    messagingSenderId: '237388872905',
    projectId: 'common-chat-24651',
    storageBucket: 'common-chat-24651.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYOvf9rKE-KbpIYy8Aiy9uLP9Z2Dpe1vw',
    appId: '1:237388872905:ios:a335c088e2e3b173f86118',
    messagingSenderId: '237388872905',
    projectId: 'common-chat-24651',
    storageBucket: 'common-chat-24651.firebasestorage.app',
    iosBundleId: 'com.example.commonAppChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYOvf9rKE-KbpIYy8Aiy9uLP9Z2Dpe1vw',
    appId: '1:237388872905:ios:a335c088e2e3b173f86118',
    messagingSenderId: '237388872905',
    projectId: 'common-chat-24651',
    storageBucket: 'common-chat-24651.firebasestorage.app',
    iosBundleId: 'com.example.commonAppChat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCeZQH0mHE54DNJRyRh90IMYg6haeOEi8w',
    appId: '1:237388872905:web:c19ebf477961b8d5f86118',
    messagingSenderId: '237388872905',
    projectId: 'common-chat-24651',
    authDomain: 'common-chat-24651.firebaseapp.com',
    storageBucket: 'common-chat-24651.firebasestorage.app',
    measurementId: 'G-Y9XRB6MR2H',
  );
}
