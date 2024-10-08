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
    apiKey: 'AIzaSyC9L800_3xTuWUtPElmaMGU4goPdxYU_Jw',
    appId: '1:784385339979:web:3be6d8fc8ee63d3b6853ce',
    messagingSenderId: '784385339979',
    projectId: 'black-8e94a',
    authDomain: 'black-8e94a.firebaseapp.com',
    storageBucket: 'black-8e94a.appspot.com',
    measurementId: 'G-2C3354MGKL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpUde0h3g1BIFO5GrVIqci824Dc7qPxaI',
    appId: '1:784385339979:android:7f5db75f1c7f8ef36853ce',
    messagingSenderId: '784385339979',
    projectId: 'black-8e94a',
    storageBucket: 'black-8e94a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAslRe9YWwS2QzwO7FNbpFWf_uA9TIEfmo',
    appId: '1:784385339979:ios:381bbfefe70a64b66853ce',
    messagingSenderId: '784385339979',
    projectId: 'black-8e94a',
    storageBucket: 'black-8e94a.appspot.com',
    iosBundleId: 'com.example.black',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAslRe9YWwS2QzwO7FNbpFWf_uA9TIEfmo',
    appId: '1:784385339979:ios:381bbfefe70a64b66853ce',
    messagingSenderId: '784385339979',
    projectId: 'black-8e94a',
    storageBucket: 'black-8e94a.appspot.com',
    iosBundleId: 'com.example.black',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC9L800_3xTuWUtPElmaMGU4goPdxYU_Jw',
    appId: '1:784385339979:web:d3ae0c9fcb4483b46853ce',
    messagingSenderId: '784385339979',
    projectId: 'black-8e94a',
    authDomain: 'black-8e94a.firebaseapp.com',
    storageBucket: 'black-8e94a.appspot.com',
    measurementId: 'G-MRZ8LTBEKG',
  );
}
