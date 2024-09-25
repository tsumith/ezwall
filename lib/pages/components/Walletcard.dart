import 'package:flutter/material.dart';

class Walletcard extends StatelessWidget {
  double? screenWidth;
  Walletcard({this.screenWidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
          color: Colors.blue,
          elevation: 10,
          shadowColor: const Color.fromARGB(255, 109, 106, 106),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth! / 7,
                ),
                child: Text("data"),
              ),
            ],
          )),
    );
  }
}
