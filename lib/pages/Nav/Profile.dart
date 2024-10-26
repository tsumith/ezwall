import 'package:flutter/material.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/components/GreyBlackBackground.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        BlackGreyGradBackground(),
        Center(
          child: WhiteText(data: "user profile and data"),
        )
      ],
    ));
  }
}
