import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function callBack;
  final String answer;
  Answer(this.callBack, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: callBack,
        child: Text(
          answer,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        color: Colors.blue,
      ),
    );
  }
}
