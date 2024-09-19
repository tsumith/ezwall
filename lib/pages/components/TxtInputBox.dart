import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  String label;
  bool obstxt;
  TextEditingController controller;
  TextBox({required this.label, this.obstxt = false, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obstxt,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Color.fromARGB(255, 119, 119, 119)),
          hintText: label,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black, width: 1),
          )),
    );
  }
}
