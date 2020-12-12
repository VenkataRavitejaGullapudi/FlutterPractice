import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final resultScore;
  final Function restartQuiz;
  Result(this.resultScore, this.restartQuiz);

  String get resultPhrase{
    var resultText = 'You did it!!';
    if(resultScore==40)
      resultText = 'Great and Awesome!!! \n You know everything about me and scored $resultScore out of 40';
    else if(resultScore<=30)
      resultText = 'You not even know a little about me and scored $resultScore out of 40';
    else if(resultScore<=35)
      resultText = 'You know a little about me and scored $resultScore out of 40';
    else if(resultScore<40)
      resultText = 'Awesome and scored $resultScore out of 40';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
          children:<Widget>[ Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontFamily: "cursive",fontWeight: FontWeight.bold),
          ),
          RaisedButton(onPressed: restartQuiz, 
          child: Text('Restart Quiz'),
          color: Colors.deepPurple,
          textColor: Colors.white,
          )
        ],
        ),
    );
  }
}
