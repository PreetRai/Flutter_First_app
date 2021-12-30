import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int qI;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.qI});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[qI]['questionText'],
        ),
        ...(questions[qI]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
