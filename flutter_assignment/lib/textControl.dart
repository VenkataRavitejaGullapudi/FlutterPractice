import 'package:flutter/material.dart';


class TextControl  extends StatelessWidget {
  final Function changeText;
  TextControl(this.changeText);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
    
      onPressed: changeText, 
      child: Text("Alter title", style: TextStyle(fontSize: 30),),
      padding: EdgeInsets.only(left:20,right: 20, top: 10, bottom: 10),
      color: Colors.greenAccent,
      textColor: Colors.black,
      splashColor: Colors.transparent,
      
      );
  }
}