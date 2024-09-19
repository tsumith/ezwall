import 'package:flutter/material.dart';

import 'components/TxtInputBox.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static const double padding = 15;
  TextEditingController _emailId = TextEditingController();
  TextEditingController _password = TextEditingController();
  Future _signUp() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              // ignore: prefer_const_constructors,
              Padding(
                padding: const EdgeInsets.all(padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _signUp,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromHeight(40),
                          surfaceTintColor: Colors.red,
                          elevation: 5,
                          enableFeedback: true),
                    ),
                    ElevatedButton(
                      onPressed: _signUp,
                      child: Text(
                        "Sign In",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
