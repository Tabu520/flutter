import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 2},
        {"text": "Blue", "score": 7},
        {"text": "Green", "score": 5}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Dog", "score": 10},
        {"text": "Cat", "score": 9},
        {"text": "Snake", "score": 1},
        {"text": "Lion", "score": 8}
      ]
    },
    {
      "questionText": "What's your favorite hero in Dota 2?",
      "answers": [
        {"text": "Juggernaut", "score": 10},
        {"text": "Invoker", "score": 4},
        {"text": "Bane", "score": 2},
        {"text": "Zues", "score": 8}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print("Answer chosen! $_questionIndex");
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print("No more question!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app!"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
  }
}
