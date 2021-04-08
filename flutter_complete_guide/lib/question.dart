// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  Question(this.question);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(50.0),
      child: Text(
        this.question,
        style: TextStyle(fontSize: 25.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
