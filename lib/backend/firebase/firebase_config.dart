import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCPYAngQ4LZCIuEgDxDBpvbHnKZoSzUnoQ",
            authDomain: "todo-4w90j6.firebaseapp.com",
            projectId: "todo-4w90j6",
            storageBucket: "todo-4w90j6.firebasestorage.app",
            messagingSenderId: "901164701210",
            appId: "1:901164701210:web:38127e938b152ee626a3a3",
            measurementId: "G-6B8N50XMNW"));
  } else {
    await Firebase.initializeApp();
  }
}
