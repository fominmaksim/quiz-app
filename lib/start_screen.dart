import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          // Opacity( //not recommended
          //   opacity: 0.5,S
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
                color: Color.fromARGB(255, 238, 224, 250), fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            style: const ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
              backgroundColor: WidgetStatePropertyAll(
                Color.fromARGB(255, 76, 2, 129),
              ),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                  color: Color.fromARGB(226, 255, 255, 255), fontSize: 18),
            ),
            onPressed: startQuiz,
          ),
        ],
      ),
    );
  }
}
