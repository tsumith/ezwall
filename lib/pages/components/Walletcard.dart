// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Walletcard extends StatefulWidget {
  int balance;
  double? screenWidth;
  Walletcard({this.screenWidth, this.balance = 0});

  @override
  State<Walletcard> createState() => _WalletcardState();
}

class _WalletcardState extends State<Walletcard> {
  int balance = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth,
      child: Card(
          color: Colors.blue,
          elevation: 10,
          shadowColor: const Color.fromARGB(255, 94, 138, 134),
          child: Padding(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWid(
                          data: "Current Balance",
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  WidgetStatePropertyAll(Size.fromRadius(23)),
                              elevation: WidgetStatePropertyAll(5),
                              shadowColor: WidgetStatePropertyAll(
                                  const Color.fromARGB(255, 11, 46, 75)),
                              backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromARGB(255, 12, 116, 201))),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        TextWid(data: "  ₹ "),
                        Text(
                          "$balance",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 40,
                              color: Colors.yellow),
                        )
                      ],
                    )
                  ],
                ),
                height: (widget.screenWidth!) / 3,
              ),
              padding: EdgeInsets.all(20))),
    );
  }
}

// ignore: must_be_immutable
class TextWid extends StatelessWidget {
  String data;
  TextWid({required this.data});

  @override
  Widget build(Object context) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: Colors.white,
          letterSpacing: 0.7),
    );
  }
}
