import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zzzwall/pages/home.dart';
import 'package:zzzwall/pages/login/sign_in.dart';
import 'package:zzzwall/pages/login/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  runApp(MaterialApp(
    routes: {
      '/SignUpPage': (context) => SignUp(),
      '/SignInPage': (context) => SignIn(),
      '/HomePage': (context) => HomePage(),
    },
    initialRoute: '/SignInPage',
  ));
}
