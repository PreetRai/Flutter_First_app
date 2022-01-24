import 'package:flutter/material.dart';

import 'package:lead_management/result.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 3},
        {'text': 'Red', 'score': 5},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Snake', 'score': 11},
        {'text': 'Lion', 'score': 9},
      ],
    },
  ];

  var _qI = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _qI = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      if (_qI < _questions.length) {
        print('we have more question');
        print(score);
      }
      _qI += 1;
    });
    print(_qI);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _qI < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                qI: _qI,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
