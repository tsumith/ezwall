import 'package:flutter/material.dart';
import 'package:zzzwall/pages/Nav/Root.dart';

class Homedrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _spacing = 30;
    return Container(
      decoration:
          BoxDecoration(color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.9)),
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 7),
      child: ListView(
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 49, 49, 49),
            ),
            child: Center(
              child: WhiteText(data: "Home"),
            ),
            height: 50,
          ),
          SizedBox(
            height: _spacing,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 49, 49, 49),
            ),
            child: Center(
              child: WhiteText(data: "Settings"),
            ),
            height: 50,
          ),
          SizedBox(
            height: _spacing,
          ),
          DrawerList(buttext: "Profile"),
          SizedBox(
            height: _spacing,
          ),
          DrawerList(buttext: "sign out"),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DrawerList extends StatelessWidget {
  String buttext;
  DrawerList({required this.buttext});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 49, 49, 49),
      ),
      child: Center(
        child: WhiteText(data: buttext),
      ),
      height: 50,
    );
  }
}
