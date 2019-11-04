import 'package:flutter/material.dart';

import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    print("Anwser choosen");
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        "questionText": 'what\'s your favorite color?',
        "answers": ["blue", "red", "black", "white"]
      },
      {
        "questionText": 'what\'s yout favorite animal',
        "answers": ["Lion", "snake", "rabbit", "Cat", "dog"]
      },
      {
        "questionText": 'what\'s yout favorite instructor',
        "answers": ["max", "max", "max", "max", "max"]
      },
    ];

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Meu App"),
            ),
            body: !(questions.length > _questionIndex)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("You did it!"),
                        RaisedButton(
                          child: Text("Fazer novamente"),
                          onPressed: () {
                            setState(() {
                              _questionIndex = 0;
                            });
                          },
                        )
                      ],
                    ),
                  )
                : Quiz(
                    questions: questions,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex)));
  }
}
