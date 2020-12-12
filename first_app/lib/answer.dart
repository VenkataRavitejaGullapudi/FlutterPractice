import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left:20,right: 20),
      child: RaisedButton(
        textColor: Colors.white,
        onPressed: selectHandler, 
        child: Text(answerText),
        color: Colors.blue,
        splashColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(15))),
        ),
    );
  }
}
