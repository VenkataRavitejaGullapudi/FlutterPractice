// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';

import 'package:flutter_assignment/app.dart';

void main()=>runApp(Assign1());

class Assign1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Assign1State();
  }

}

class _Assign1State extends State<Assign1> {
  String _someText = "Random Text";
  void _changeText(){
    setState(() {
      if(_someText=="Hello Flutter")
        _someText = "Random Title";
      else
        _someText = "Hello Flutter";
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Assignment1"),
          backgroundColor: Colors.blueGrey,
        ),
        body: App(_someText,_changeText),
      ),
    );
  }
}