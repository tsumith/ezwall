import 'package:flutter/material.dart';
import 'package:zzzwall/pages/components/Button1.dart';
import 'package:zzzwall/pages/components/Walletcard.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int balance = 0;
    double screenWidth = MediaQuery.of(context).size.width;
    double sidePadding = 15;
    // TODO: implement build
    return Stack(children: [
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
                text: "Add",
                color: const Color.fromARGB(255, 11, 65, 109),
              ),
              SizedBox(
                width: 15,
              ),
              Button1(
                onpressed: () {},
                text: "Send",
                color: const Color.fromARGB(255, 27, 119, 5),
              ),
              SizedBox(
                width: 15,
              ),
              Button1(
                onpressed: () {},
                text: "Transfer",
                shadowcolor: Colors.white,
                color: const Color.fromARGB(255, 196, 85, 51),
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}

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
