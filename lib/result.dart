import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 380) {
      resultText = "you know me";
    } else if (resultScore <= 400) {
      resultText = "you exceeded my expectations ";
    }

    return resultText;
  }

  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text(
        resultPhrase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
      ElevatedButton(onPressed: resetHandler, child: Text('reset'))
    ]));
  }
}
