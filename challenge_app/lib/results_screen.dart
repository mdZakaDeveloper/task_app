import 'package:challenge_app/data/questions.dart';
import 'package:challenge_app/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.collectedOptions, required this.restartQuiz});

  final List<String> collectedOptions;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < collectedOptions.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].options[0],
          'user_selected': collectedOptions[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final correctQuestions = summaryData
        .where((data) => data['user_selected'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have scored $correctQuestions out of $totalQuestions',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            QuestionsSummary(
              summaryData,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.refresh,
                color: Colors.black,
                size: 20,
              ),
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
