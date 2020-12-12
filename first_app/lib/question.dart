import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // In stateless widget properties must be immutable. So final make it unchangeable therefore immutable.
  final String questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        //infinity means full width of device here
        // now Text can take into center
        width: double.infinity,
        margin: EdgeInsets.only(top: 30, bottom: 5),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ));
  }
}
