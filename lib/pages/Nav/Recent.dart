import 'package:flutter/material.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/components/GreyBlackBackground.dart';

class RecentPage extends StatefulWidget {
  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Stack(
      children: [
        BlackGreyGradBackground(),
        Center(
          child: WhiteText(data: "no recent transactions"),
        )
      ],
    ));
  }
}
