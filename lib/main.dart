import 'package:flutter/material.dart';

import './question.dart';

import './answer.dart';

import './quiz.dart';

import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'whats your name?',
      'answers': [
        {'text': 'PAUL', 'score': 100},
        {'text': 'TRISTAN', 'score': 110},
        {'text': 'WOLOWITZ', 'score': 80},
        {'text': 'CAN', 'score': 10000}
      ]
    },
    {
      'questionText': 'whats your fave movie?',
      'answers': [
        {'text': 'REAL GENTS PREFER BLONDES', 'score': 95},
        {'text': 'THE DARK KNIGHT', 'score': 89},
        {'text': 'ITS A WONDERFUL LIFE', 'score': 100},
        {'text': 'DRAGON LORD', 'score': 78}
      ]
    },
    {
      'questionText': 'who is your crush?',
      'answers': [
        {'text': 'Khristina', 'score': 100},
        {'text': 'Christina', 'score': 100}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totatlScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totatlScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totatlScore = _totatlScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("more questions....");
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firstious App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totatlScore, _resetQuiz),
      ),
    );
  }
}
