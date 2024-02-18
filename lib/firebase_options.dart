// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBuTuX11SoetpXZ3s7P0PpOqn8biT0UyTM',
    appId: '1:468893770704:web:406103a6ef3c670368cfd5',
    messagingSenderId: '468893770704',
    projectId: 'biztrack-cp',
    authDomain: 'biztrack-cp.firebaseapp.com',
    storageBucket: 'biztrack-cp.appspot.com',
    measurementId: 'G-KW7LRQ6K1B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjd1RkQIRx6vkIHRxAwDdPjq0yAHAAwzA',
    appId: '1:468893770704:android:511b2722bb05819768cfd5',
    messagingSenderId: '468893770704',
    projectId: 'biztrack-cp',
    storageBucket: 'biztrack-cp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAN3G3tHW26pWEcrIhInMFF2bdhpdwVE7c',
    appId: '1:468893770704:ios:2ca187507b926a9f68cfd5',
    messagingSenderId: '468893770704',
    projectId: 'biztrack-cp',
    storageBucket: 'biztrack-cp.appspot.com',
    iosBundleId: 'com.example.biztrack',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAN3G3tHW26pWEcrIhInMFF2bdhpdwVE7c',
    appId: '1:468893770704:ios:bdc5f9bf9b9ad59b68cfd5',
    messagingSenderId: '468893770704',
    projectId: 'biztrack-cp',
    storageBucket: 'biztrack-cp.appspot.com',
    iosBundleId: 'com.example.biztrack.RunnerTests',
  );
}
