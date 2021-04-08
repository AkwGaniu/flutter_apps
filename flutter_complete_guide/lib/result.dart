import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function resetHandler;

  Result(this.finalScore, this.resetHandler);

  String get finalRemark {
    var remarkText = 'Wow.. you did it!';
    if (finalScore <= 8) {
      remarkText = 'You are awesome and innocent!';
    } else if (finalScore <= 12) {
      remarkText = 'Pretty likeable!';
    } else if (finalScore <= 16) {
      remarkText = 'You are ... strange?!';
    } else {
      remarkText = 'You are so bad!';
    }
    return remarkText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            finalRemark,
            style: TextStyle(fontSize: 30.5),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Reset Quiz',
              style: TextStyle(
                color: Colors.green,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
