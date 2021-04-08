import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedIndex;
  final Function changeIndex;

  Quiz({
    @required this.questions,
    @required this.selectedIndex,
    @required this.changeIndex
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[selectedIndex]['questionText']),
        ...(questions[selectedIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => changeIndex(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}