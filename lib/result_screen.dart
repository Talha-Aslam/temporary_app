import 'package:flutter/material.dart';
import 'package:temporary_app/data/questions.dart';
import 'package:temporary_app/summary_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.selectedAnswer, required this.restartQuiz, super.key});
  final void Function() restartQuiz;
  final List<String> selectedAnswer;
//summary data
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < questionsList.length; i++) {
      summaryData.add({
        "question_index": i,
        "question": questionsList[i].questions,
        "correct_answer": questionsList[i].answers[0],
        "selected_answer": selectedAnswer[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(context) {
    final totalQuestionnum = questionsList.length;
    final totalcorrectQuestion = getSummaryData().where((data) {
      return data['correct_answer'] == data['selected_answer'];
    }).length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "You have answered $totalcorrectQuestion correct out of $totalQuestionnum",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.orange[900]),
          ),
          const SizedBox(height: 40),
          QuizSummary(data: getSummaryData()),
          const SizedBox(height: 60),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: restartQuiz,
            label: const Text(
              "Restart Quiz",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            icon: const Icon(
              Icons.restart_alt_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
