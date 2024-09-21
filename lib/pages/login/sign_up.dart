// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static const double padding = 30;
  TextEditingController _emailId = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _username = TextEditingController();
  Future<void> _signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailId.text.trim(), password: _password.text.trim())
          .then((value) {
        Navigator.pushNamed(context, '/SignInPage');
      });
    } catch (e) {
      Navigator.pushNamed(context, '/SignUpPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: 0.5, // Takes up 50% of the screen height
            widthFactor: 1.0, // Takes up full width
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color.fromARGB(
                        255, 233, 195, 183), // Start color at the bottom
                    const Color.fromARGB(
                        0, 255, 218, 218), // End color towards the top
                  ],
                ),
              ),
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage("assets/emoji1.jpg"),
                          fit: BoxFit.fill)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sign Up if you haven't already",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 119, 119, 119)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding),
                  child: TextField(
                    controller: _username,
                    decoration: InputDecoration(
                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 119, 119, 119)),
                        hintText: "Username",
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 185, 106, 106),
                              width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding),
                  child: TextField(
                    controller: _emailId,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 119, 119, 119)),
                        hintText: "email Id",
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 185, 106, 106),
                              width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding),
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 119, 119, 119)),
                        hintText: "password",
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 185, 106, 106),
                              width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // ignore: prefer_const_constructors,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _signUp,
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromHeight(40),
                            surfaceTintColor: Colors.red,
                            elevation: 5,
                            enableFeedback: true),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignInPage');
                        },
                        child: Text(
                          "    Login    ",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromHeight(40),
                            surfaceTintColor: Colors.red,
                            elevation: 5,
                            enableFeedback: true),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
