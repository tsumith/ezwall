import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailId = TextEditingController();
  TextEditingController _password = TextEditingController();
  static double padding = 30;
  void _signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailId.text.trim(), password: _password.text.trim())
          .then((value) {
        Navigator.pushNamed(context, "/HomePage");
      });
    } catch (e) {
      Navigator.pushNamed(context, "/SignUpPage");
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
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("/cash.jpg"), fit: BoxFit.fill)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Login into zzzwall",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 119, 119, 119)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: TextField(
                    controller: _emailId,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 119, 119, 119)),
                        hintText: "email id",
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
                  padding: EdgeInsets.symmetric(horizontal: padding),
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
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignUpPage');
                        },
                        child: Text(
                          "  Sign Up  ",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromHeight(40),
                            surfaceTintColor: Colors.red,
                            elevation: 5,
                            enableFeedback: true),
                      ),
                      ElevatedButton(
                        onPressed: _signIn,
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
