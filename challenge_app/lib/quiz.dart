import 'package:challenge_app/questions_screen.dart';
import 'package:challenge_app/results_screen.dart';
import 'package:challenge_app/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:challenge_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswers(String answers) {
    selectedAnswers.add(answers);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Approach to Switch Widgets

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswers);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        collectedOptions: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

    // if (activeScreen == 'results-screen'){
    //   selectedAnswers = [];
    //   activeScreen = 'question-screen';
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 100, 204, 197),
            Color.fromARGB(255, 23, 107, 135),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: screenWidget,
      )),
    );
  }
}
