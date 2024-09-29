import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  void Function() onpressed;
  String text;
  Color color;
  Button1(
      {required this.onpressed, required this.text, this.color = Colors.brown});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black.withOpacity(0.5),
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            shadowColor: color.withOpacity(0.5),
            minimumSize: Size(0, 60),
            elevation: 5),
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
