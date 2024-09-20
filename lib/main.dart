import 'package:flutter/material.dart';
import 'package:zzzwall/pages/home.dart';
import 'package:zzzwall/pages/sign_in.dart';
import 'package:zzzwall/pages/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    routes: {
      '/SignUpPage': (context) => SignUp(),
      '/SignInPage': (context) => SignIn(),
      '/HomePage': (context) => HomePage(),
    },
    initialRoute: '/SignInPage',
  ));
}
