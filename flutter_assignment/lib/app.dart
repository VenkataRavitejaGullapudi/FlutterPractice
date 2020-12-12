import 'package:flutter/material.dart';
import 'package:flutter_assignment/textControl.dart';
import 'package:flutter_assignment/textWidget.dart';

class App extends StatelessWidget {
  final String text;
  final Function fun;

  App(this.text, this.fun);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        
        child: Column(
          children: <Widget>[
            TextWidget(text),
            TextControl(fun),
          ],
        ),
        padding: EdgeInsets.all(20),

    );
  }
}
