import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zzzwall/pages/Nav/Root.dart';
import 'package:zzzwall/pages/components/GreyBlackBackground.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String currentTime = '';
  void _updateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy hh:mm');
    currentTime = formatter.format(now);
    setState(() {});
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Current datetime"),
            content: Text("$currentTime"),
          );
        });
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
            TextButton(
              onPressed: _updateTime,
              child: Text("data"),
            )
          ],
        )
      ],
    ));
  }
}
