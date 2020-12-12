import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  TextWidget(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontFamily: "cursive", fontSize: 60),
      
      );
  }
}