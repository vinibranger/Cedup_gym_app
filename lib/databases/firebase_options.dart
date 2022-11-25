
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDMo1Js9DYluiQFaNk_OXutLYrw6pMnLGg',
    appId: '1:680368584060:web:f8d2ea95da805ed10a60f9',
    messagingSenderId: '680368584060',
    projectId: 'persoufit',
    authDomain: 'persoufit.firebaseapp.com',
    databaseURL: 'https://persoufit-default-rtdb.firebaseio.com',
    storageBucket: 'persoufit.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCswLKd8pqtlCjwBkPvrH5CGCPAsfF5jRI',
    appId: '1:680368584060:android:349c1c96419c35c00a60f9',
    messagingSenderId: '680368584060',
    projectId: 'persoufit',
    databaseURL: 'https://persoufit-default-rtdb.firebaseio.com',
    storageBucket: 'persoufit.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABBp8vjzwLsMVxFC4wA3i1GYNIOGJNuBQ',
    appId: '1:680368584060:ios:1ae0d28d8e8c53bb0a60f9',
    messagingSenderId: '680368584060',
    projectId: 'persoufit',
    databaseURL: 'https://persoufit-default-rtdb.firebaseio.com',
    storageBucket: 'persoufit.appspot.com',
    iosClientId:
        '680368584060-vko5r962vg4b7e4q9n5q5amg7bftsnsi.apps.googleusercontent.com',
    iosBundleId: 'com.cedup.vinicius.viniciustcc',
  );
}
