import 'package:flutter/material.dart';

import 'components/TxtInputBox.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static const double padding = 30;
  TextEditingController _emailId = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _username = TextEditingController();
  Future _signUp() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("assets/cash.png"),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Sign Up if you haven't already",
                  style: TextStyle(
                      fontSize: 25, color: Color.fromARGB(255, 119, 119, 119)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: TextBox(
                  label: "Username",
                  controller: _username,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: TextBox(
                  label: "Email id",
                  controller: _emailId,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: TextBox(
                  label: "password",
                  controller: _password,
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
    );
  }
}
