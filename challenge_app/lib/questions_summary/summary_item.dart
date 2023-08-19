import 'package:challenge_app/questions_summary/question_identifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItems extends StatelessWidget {
  const SummaryItems(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {

    final String userAnswerInsertText = itemData['user_selected'] as String;
    final String correctAnswerInsertText = itemData['correct_answer'] as String;


    final isCorrectAnswer =
        itemData['user_selected'] == itemData['correct_answer'];

    return Padding(
      padding: const  EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
              isCorrectAnswer: isCorrectAnswer,
              question_index: itemData['question_index'] as int),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  ' Selected : Your Answer is $userAnswerInsertText',
                  style: GoogleFonts.inter(
                    color: isCorrectAnswer ? Color.fromARGB(255, 5, 0, 47) : Color.fromARGB(255, 255, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '	• The Correct Answer is $correctAnswerInsertText',
                  style: GoogleFonts.inter(
                      color: const Color.fromARGB(255, 218, 255, 251),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
