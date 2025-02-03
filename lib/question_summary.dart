import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summary.map(
              (questions) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue.shade100,
                            shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Text('${(questions['question_id'] as int) + 1}'),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${questions['question_id']}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                          Text('${questions['user_answer']}',
                              style: TextStyle(color: Colors.red.shade300)),
                          Text('${questions['correct_answer']}',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
