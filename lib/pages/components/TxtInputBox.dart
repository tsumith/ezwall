import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  String label;
  bool obstxt;
  TextEditingController controller;
  TextBox({required this.label, this.obstxt = false, required this.controller});

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obstxt,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Color.fromARGB(255, 119, 119, 119)),
          hintText: widget.label,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color.fromARGB(255, 185, 106, 106), width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black, width: 1),
          )),
    );
  }
}
