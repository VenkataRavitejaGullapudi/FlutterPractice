import 'package:flutter/material.dart';
// Material dart  will have lots of themes which work on both ios and android and it also supports to create our own widget

import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';

void main() => runApp(MyApp());
//runApp Takes object of the our widget to run widget

// Now after extending we can create our own widget
// After extending it raises as missing build method implementation(may be abstract).
class MyApp extends StatefulWidget {
  // Which mentions that the state is MyAppState
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// Widget_name+State(Convention)
// State<MyApp> - State belongs to MyApp
class _MyAppState extends State<MyApp> {
  var _questions = [
    {
      'questionText': "What is Ravi's favourite color?",
      'answers': [
          {"text": "Blue","score":9},
          {"text": "White","score":6},
          {"text": "Green","score":10},
          {"text": "Red","score":0},
        ]
    },
    {
      'questionText': "What is Ravi's favourite food?",
      'answers': [
          {"text": "Dosa","score":6},
          {"text": "Pizza","score":6},
          {"text": "Puri","score":10},
          {"text": "Idli","score":3},
          {"text": "Bread & Jam","score":1},
        ]
    },
    {
      'questionText': "Which outdoor game Ravi prefers to play?",
      'answers': [
          {"text": "Cricket","score":7},
          {"text": "Chess","score":10},
          {"text": "Badminton","score":9},
          {"text": "Football","score":10},
          {"text": "Hockey","score":0},

        ]
    },
    {
      'questionText': "What is Ravi's favourite animal in the below?",
      'answers': [
          {"text": "Tiger","score":5},
          {"text": "Elephant","score":6},
          {"text": "Cheetah","score":10},
          {"text": "Lion","score":7},

        ]
     },
  ];

  //placed here as build method may always rerun everytime the widget builds which can of any time.
  //But in the state less widget questionIndex must be immutable i.e., not changeable so it asks to make it final
  // So we using Stateful widget
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      // Not used set state as we no need to recall the build method on the change of this variable.
      _totalScore += score;
      print(_questionIndex);
    } else {
      print('No more questions');
    }
  }

// Restarting Quiz
void _restartQuiz(){
  setState(() {
    _questionIndex=0;
    _totalScore = 0;
  });
}


  // context is a object of build context which has some meta information about our app and this widget
  // build method is called by the flutter automatically and it return widget type
  // here we have returned material app which is also in material dart file in the flutter.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // Scafflod() is another widget which is baked into material dart and it has a job of creating a base page design, structure and color scheme
    // for your app which contains some named arguments (to get the autocompletion in ide use ctrl+space).
    // appBar takes PreferredSizeWidget as parameter (here we provided predefined AppBar() present in material dart)
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Lets Go Flutter'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questions: _questions,
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex)
          : Result(_totalScore,_restartQuiz),
    ));
  }
}
