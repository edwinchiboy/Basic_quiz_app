import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

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
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answer': [
          {'text': 'Black', 'score': 10},
          {'Text': 'Red', 'score': 5},
          {'Text': 'Green', 'score': 3},
          {'test': 'white', 'score': 1}
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answer': [
          {'text': 'Goat', 'score': 10},
          {'Text': 'Hen', 'score': 5},
          {'Text': 'Rabbit', 'score': 3},
          {'test': 'Lion', 'score': 1}
        ],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answer': [
          {'text': 'Max', 'score': 10},
          {'Text': 'John', 'score': 5},
          {'Text': 'Joel', 'score': 3},
          {'test': 'Jude', 'score': 1}
        ],
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
