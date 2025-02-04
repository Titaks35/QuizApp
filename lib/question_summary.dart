import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.purple.shade300, shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Text(
                "1",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(width: 10,),

            Column(
              children: [
                Text("data1"),
                Text("data2"),
                Text("data3"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
