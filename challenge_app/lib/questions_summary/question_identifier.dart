import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final int question_index;
  final bool isCorrectAnswer;

  const QuestionIdentifier(
      // ignore: non_constant_identifier_names
      {
    super.key,
    required this.isCorrectAnswer,
    required this.question_index,
  });

  @override
  Widget build(BuildContext context) {
    final questionNumber = question_index + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrectAnswer
              ? Color.fromARGB(255, 0, 28, 48)
              : Color.fromARGB(255, 255, 0, 119),
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.interTight(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
