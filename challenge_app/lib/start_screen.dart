import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  final imageHolder = 'assets/images/quiz-logo.png';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Concept of Transparency
          // Opacity(
          //   opacity: 0.7,
          // child:

          Image.asset(imageHolder, width: 250),
          // ),
          const SizedBox(height: 50),
          Text(
            "Learn Flutter the Fun Way!",
            style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold, 
                color: Colors.white),
          ),
          const SizedBox(height: 50),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.arrow_right,
              color: Colors.black,
              size: 40,
            ),
            onPressed: startQuiz,
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            label: const Text(
              "Start Quiz",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
