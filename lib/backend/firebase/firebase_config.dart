import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBJwsfEY6G9wqoYmFyJU_dV6FyWhXZTNjU",
            authDomain: "dialogi-utan34.firebaseapp.com",
            projectId: "dialogi-utan34",
            storageBucket: "dialogi-utan34.appspot.com",
            messagingSenderId: "5644528133",
            appId: "1:5644528133:web:dc7e29665659f3253a8a6c",
            measurementId: "G-WKZ9S3D06X"));
  } else {
    await Firebase.initializeApp();
  }
}
