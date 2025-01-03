import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerOptions, {super.key});

  final String answerOptions;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 1, 18, 95),
        foregroundColor: Colors.white,
      ),
      child: Text(answerOptions),
    );
  }
}
