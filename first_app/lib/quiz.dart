import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        // Get the answers from the questions map and they are taken in the form of list of strings as
        // map directly not able to detect the list and the answers are given to the map and in the map we have returned
        // the Answer Widget by passing the handler and the answer text into it.
        // Later we need to return the list of answers not the iterable which is returned by the map and here children is
        // already a list and we need not to have again a list of answers as it may not recognise, so by using the '...' spread operator
        // we destructured the list so that Answer widgets will directly come into the children list instead of answered list.
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
          return Answer(()=>answerQuestion(answer["score"]), answer['text']);
        }).toList(),
      ],
    );
  }
}
