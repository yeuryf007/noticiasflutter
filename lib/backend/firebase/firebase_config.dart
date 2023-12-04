import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyClOuhE7YOP8eBKtpxyzuWosS2nuJR9xBQ",
            authDomain: "noticias-88490.firebaseapp.com",
            projectId: "noticias-88490",
            storageBucket: "noticias-88490.appspot.com",
            messagingSenderId: "896811046888",
            appId: "1:896811046888:web:6bc37dbd97ac12b0e9b65d"));
  } else {
    await Firebase.initializeApp();
  }
}
