import 'package:flutter/material.dart';
import 'package:zzzwall/pages/home.dart';
import 'package:zzzwall/pages/sign_in.dart';
import 'package:zzzwall/pages/sign_up.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/SignUpPage': (context) => SignUp(),
      '/SignInPage': (context) => SignIn(),
      '/HomePage': (context) => HomePage(),
    },
    initialRoute: '/SignInPage',
  ));
}
