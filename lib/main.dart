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
      'answers': ['Black', 'Red', 'Blue', 'Green'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Lion', 'Elephant', 'Snake', 'Rabbit'],
    },
  ];

  var _qI = 0;

  void _answerQuestion() {
    setState(() {
      if (_qI < _questions.length) {
        print('we have more question');
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
            : Result(),
      ),
    );
  }
}
