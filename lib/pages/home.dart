// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zzzwall/pages/components/Button1.dart';
import 'package:zzzwall/pages/components/HomeDrawer.dart';
import 'package:zzzwall/pages/components/Walletcard.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushNamed(context, '/SignInPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    int balance = 0;
    double screenWidth = MediaQuery.of(context).size.width;
    double sidePadding = 20;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WhiteText(data: "zzzwall"),
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: _signOut,
                style: ButtonStyle(
                    iconColor: WidgetStatePropertyAll(Colors.white)),
              )
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: Stack(children: [
          Align(
            child: FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black,
                      const Color.fromARGB(255, 37, 37, 37)
                    ])),
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(sidePadding),
                child: WhiteText(
                  size: 20,
                  data: "Your Wallet",
                ),
              ),
              Walletcard(
                screenWidth: screenWidth,
                balance: balance,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button1(
                    onpressed: () {},
                    text: "Add amount",
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Button1(
                    onpressed: () {},
                    text: "Send",
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Button1(
                    onpressed: () {},
                    text: "Transfer",
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ],
          ),
        ]),
        //drawer
        drawer: Homedrawer());
  }
}

// ignore: must_be_immutable
class WhiteText extends StatelessWidget {
  String data;
  double? size;
  WhiteText({required this.data, this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: size,
        color: Colors.white,
      ),
    );
  }
}
