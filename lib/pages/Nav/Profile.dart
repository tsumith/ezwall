import 'package:flutter/material.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/components/GreyBlackBackground.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color myCol = const Color.fromARGB(255, 20, 54, 116);
  Color _changeColor(Color col) {
    var myCol = col;

    if (myCol == Color.fromARGB(255, 20, 54, 116)) {
      myCol = Colors.blue;
    } else {
      myCol = Color.fromARGB(255, 20, 54, 116);
    }
    return myCol;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        BlackGreyGradBackground(),
        ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                var col = _changeColor(myCol);
                myCol = col;
                setState(() {});
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: WhiteText(data: "settings"),
                ),
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      myCol,
                      const Color.fromARGB(255, 27, 62, 109),
                      myCol
                    ]),
                    borderRadius: BorderRadius.circular(30)),
              ),
            )
          ],
        )
      ],
    ));
  }
}
