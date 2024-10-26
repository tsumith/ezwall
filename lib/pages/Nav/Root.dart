import 'package:flutter/material.dart';
import 'package:zzzwall/pages/components/Button1.dart';
import 'package:zzzwall/pages/components/GreyBlackBackground.dart';
import 'package:zzzwall/pages/components/Walletcard.dart';

class RootPage extends StatefulWidget {
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double sidePadding = 15;
    return Container(
      child: Stack(children: [
        BlackGreyGradBackground(),
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
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button1(
                  onpressed: () {
                    Navigator.pushNamed(context, 'AddPage');
                  },
                  text: "Add",
                  color: const Color.fromARGB(255, 11, 65, 109),
                ),
                SizedBox(
                  width: 15,
                ),
                Button1(
                  onpressed: () {
                    Navigator.pushNamed(context, 'SpendPage');
                  },
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
      ]),
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
