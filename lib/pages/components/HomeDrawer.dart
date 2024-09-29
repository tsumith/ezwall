import 'package:flutter/material.dart';

class Homedrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.yellow,
          height: 40,
        ),
        Container(
          height: 40,
          color: Colors.yellow[800],
        )
      ],
    );
  }
}
