import 'package:flutter/material.dart';
import 'package:zzzwall/pages/Nav/Root.dart';

class Homedrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5)),
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 3),
      child: ListView(
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 49, 49, 49),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: WhiteText(data: "Settings"),
            ),
            height: 50,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 49, 49, 49),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: WhiteText(data: "Home"),
            ),
            height: 50,
          )
        ],
      ),
    );
  }
}
