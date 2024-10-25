import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zzzwall/pages/Nav/Activity.dart';
import 'package:zzzwall/pages/Nav/Profile.dart';
import 'package:zzzwall/pages/Nav/Recent.dart';
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
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(bottomAppBarTheme: BottomAppBarTheme(color: Colors.black)),
      debugShowCheckedModeBanner: false,
      routes: {
        '/SignUpPage': (context) => SignUp(),
        '/SignInPage': (context) => SignIn(),
        '/HomePage': (context) => HomePage(),
        'ProfilePage': (context) => ProfilePage(),
        'ActivityPage': (context) => ActivityPage(),
        'RecentPage': (context) => RecentPage()
      },
      initialRoute: user != null ? '/HomePage' : '/SignInPage',
    );
  }
}
