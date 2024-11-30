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
    apiKey: 'AIzaSyCgl0Ljg6gJpYxsORIYCuCNxbFyIOKw7qs',
    appId: '1:23797681793:web:9873aca290b4fa7eec4780',
    messagingSenderId: '23797681793',
    projectId: 'medistockwm',
    authDomain: 'medistockwm.firebaseapp.com',
    databaseURL: 'https://medistockwm-default-rtdb.firebaseio.com',
    storageBucket: 'medistockwm.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHVV3F73nr_LgNPAMf3uDmEq7wc6EPgUQ',
    appId: '1:23797681793:android:f4341351f86024bdec4780',
    messagingSenderId: '23797681793',
    projectId: 'medistockwm',
    databaseURL: 'https://medistockwm-default-rtdb.firebaseio.com',
    storageBucket: 'medistockwm.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDg9-OiswSG6_Moex8_Re3o2Y8q1Fy4B3M',
    appId: '1:23797681793:ios:513a6ec6667b7ba2ec4780',
    messagingSenderId: '23797681793',
    projectId: 'medistockwm',
    databaseURL: 'https://medistockwm-default-rtdb.firebaseio.com',
    storageBucket: 'medistockwm.firebasestorage.app',
    iosBundleId: 'com.example.medistock',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDg9-OiswSG6_Moex8_Re3o2Y8q1Fy4B3M',
    appId: '1:23797681793:ios:513a6ec6667b7ba2ec4780',
    messagingSenderId: '23797681793',
    projectId: 'medistockwm',
    databaseURL: 'https://medistockwm-default-rtdb.firebaseio.com',
    storageBucket: 'medistockwm.firebasestorage.app',
    iosBundleId: 'com.example.medistock',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCgl0Ljg6gJpYxsORIYCuCNxbFyIOKw7qs',
    appId: '1:23797681793:web:5843ffee852ee31eec4780',
    messagingSenderId: '23797681793',
    projectId: 'medistockwm',
    authDomain: 'medistockwm.firebaseapp.com',
    databaseURL: 'https://medistockwm-default-rtdb.firebaseio.com',
    storageBucket: 'medistockwm.firebasestorage.app',
  );
}
