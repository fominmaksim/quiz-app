import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.setSelectedAnswer});

  final void Function(String answer) setSelectedAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var activeQuestionIndex = 0;

  void handleSubmitAnswer(String answer) {
    widget.setSelectedAnswer(answer);
    setState(
      () {
        // activeQuestionIndex = activeQuestionIndex + 1;
        // or
        // if (activeQuestionIndex < 5) {
        activeQuestionIndex++;
        // }
      },
    );
  }

  @override
  Widget build(context) {
    final QuizQuestion currentQuestion = questions[activeQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ...currentQuestion.getShuffledAnswers().map(
              (item) {
                return AnswerButton(
                    answerText: item,
                    onTap: () {
                      handleSubmitAnswer(item);
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
