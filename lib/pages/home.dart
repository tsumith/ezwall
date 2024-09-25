// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
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
              style:
                  ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
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
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: WhiteText(
                size: 20,
                data: "Add your wallet",
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                        elevation: 10,
                        shadowColor: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: screenWidth / 7,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Add your wallet"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                      highlightColor: const Color.fromARGB(
                                          255, 114, 151, 180),
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Walletcard(
                    screenWidth: screenWidth,
                  )
                ],
              ),
            )
          ],
        ),
      ]),
      drawer: ListView(
        children: [
          Container(
            color: Colors.amber,
            height: 40,
          )
        ],
      ),
    );
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
