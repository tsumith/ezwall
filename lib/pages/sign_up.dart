import 'package:flutter/material.dart';
import 'components/TxtInputBox.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailId = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              TextBox(
                label: "Email id",
                controller: _emailId,
              ),
              TextBox(
                label: "password",
                controller: _password,
              )
            ],
          ),
        ),
      ),
    );
  }
}
