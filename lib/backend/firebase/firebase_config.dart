import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCOYzhRrjBYiR-DZiGcfNNi6LINZbYINpQ",
            authDomain: "timesnews-1c113.firebaseapp.com",
            projectId: "timesnews-1c113",
            storageBucket: "timesnews-1c113.appspot.com",
            messagingSenderId: "421926190075",
            appId: "1:421926190075:web:c34f1192eef14af481e95e",
            measurementId: "G-T3ZFRNHPGC"));
  } else {
    await Firebase.initializeApp();
  }
}
