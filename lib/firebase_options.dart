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
    apiKey: 'AIzaSyDq1GmKQ6VtIQFwWnl14qL6Gy1gb27cEw0',
    appId: '1:433855990893:web:bc137d25545933ebe2c364',
    messagingSenderId: '433855990893',
    projectId: 'fir-realm-51fa3',
    authDomain: 'fir-realm-51fa3.firebaseapp.com',
    storageBucket: 'fir-realm-51fa3.appspot.com',
    measurementId: 'G-4LECP1W4KY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXqx1bgkCw1fc7qrEZVxjzaQKFL7M1ecc',
    appId: '1:433855990893:android:273490856ed449aae2c364',
    messagingSenderId: '433855990893',
    projectId: 'fir-realm-51fa3',
    storageBucket: 'fir-realm-51fa3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsipsf5zzrlXbAZqMe0cb6bg5dPTRm1Ig',
    appId: '1:433855990893:ios:ba2180153fff9275e2c364',
    messagingSenderId: '433855990893',
    projectId: 'fir-realm-51fa3',
    storageBucket: 'fir-realm-51fa3.appspot.com',
    iosBundleId: 'com.example.gsmTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsipsf5zzrlXbAZqMe0cb6bg5dPTRm1Ig',
    appId: '1:433855990893:ios:c69795d43ef993ece2c364',
    messagingSenderId: '433855990893',
    projectId: 'fir-realm-51fa3',
    storageBucket: 'fir-realm-51fa3.appspot.com',
    iosBundleId: 'com.example.gsmTask.RunnerTests',
  );
}
