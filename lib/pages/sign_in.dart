import 'package:flutter/material.dart';
import 'components/TxtInputBox.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailId = TextEditingController();
  TextEditingController _password = TextEditingController();
  static double padding = 30;
  void _signIn() {}

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
                  "Login into zzwall",
                  style: TextStyle(
                      fontSize: 25, color: Color.fromARGB(255, 119, 119, 119)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: TextBox(
                  label: "Email id",
                  controller: _emailId,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
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
    );
  }
}
