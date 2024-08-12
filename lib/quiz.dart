import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String? activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void setSelectedAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
    });

    if (selectedAnswers.length == questions.length) {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        setSelectedAnswer: setSelectedAnswer,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 91, 0, 157),
              Color.fromARGB(255, 76, 2, 129),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
