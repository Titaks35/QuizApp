import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/quizz.dart';
import 'package:myapp/question_summary.dart';
import 'package:myapp/start_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers; // User's selected Answer.

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      bool isCorrect = selectedAnswers[i] == questions[i].answers[0];

      summaryData.add({
        'question_id': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
        'is_correct': isCorrect
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final totalMark = summary.where((data) => data['is_correct'] as bool).length;
    final totalQuestion = questions.length;
    // Copy from questions_screen.dart
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.blue],
            ),
          ),
          child: SizedBox(
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You answered $totalMark out of $totalQuestion questions correctly',
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 6, 80, 184),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  QuestionSummary(summary: getSummaryData()),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton.icon(
                    icon: const Icon(
                      Icons.restart_alt,
                      color: Colors.white,
                      size: 15,
                    ),
                    label: const Text(
                      'Restart Quiz',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
