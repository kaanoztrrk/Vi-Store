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
    apiKey: 'AIzaSyBiHSbqHzhY0JOoP38fBy1DxO-CTQCC8wA',
    appId: '1:272895926504:web:216b33d821ac2ad713e95d',
    messagingSenderId: '272895926504',
    projectId: 'ecommerce-8fb97',
    authDomain: 'ecommerce-8fb97.firebaseapp.com',
    storageBucket: 'ecommerce-8fb97.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYUEwC7Qy_s8j3K3PEMKhfEaL4QVN7Ay4',
    appId: '1:272895926504:android:637f5fc12fab6a9b13e95d',
    messagingSenderId: '272895926504',
    projectId: 'ecommerce-8fb97',
    storageBucket: 'ecommerce-8fb97.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUTElXzAF2TuEIXg8Cn3XOAb44bx9Ff-E',
    appId: '1:272895926504:ios:dc7f18b77f8a559513e95d',
    messagingSenderId: '272895926504',
    projectId: 'ecommerce-8fb97',
    storageBucket: 'ecommerce-8fb97.appspot.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUTElXzAF2TuEIXg8Cn3XOAb44bx9Ff-E',
    appId: '1:272895926504:ios:dc7f18b77f8a559513e95d',
    messagingSenderId: '272895926504',
    projectId: 'ecommerce-8fb97',
    storageBucket: 'ecommerce-8fb97.appspot.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBiHSbqHzhY0JOoP38fBy1DxO-CTQCC8wA',
    appId: '1:272895926504:web:ae0202cf0f0064ce13e95d',
    messagingSenderId: '272895926504',
    projectId: 'ecommerce-8fb97',
    authDomain: 'ecommerce-8fb97.firebaseapp.com',
    storageBucket: 'ecommerce-8fb97.appspot.com',
  );
}
