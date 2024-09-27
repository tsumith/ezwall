import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Walletcard extends StatefulWidget {
  double? screenWidth;
  Walletcard({this.screenWidth});

  @override
  State<Walletcard> createState() => _WalletcardState();
}

class _WalletcardState extends State<Walletcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
          color: Colors.blue,
          elevation: 10,
          shadowColor: const Color.fromARGB(255, 109, 106, 106),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: widget.screenWidth! / 7,
                ),
                child: Text("data"),
              ),
            ],
          )),
    );
  }
}
