import 'package:flutter/material.dart';
import 'package:temporary_app/data/questions.dart';
import 'package:temporary_app/result_screen.dart';
import 'package:temporary_app/start_screen.dart';
import 'package:temporary_app/quiz_screen.dart';

class QuizMainPage extends StatefulWidget {
  const QuizMainPage({super.key});
  @override
  State<QuizMainPage> createState() {
    return _QuizMainPageState();
  }
}

class _QuizMainPageState extends State<QuizMainPage> {
  Widget? activeScreen;
  List<String> selectedAnswerList = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(startQuiz: changeScreen);
  }

  void changeScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: choseAnswer);
    });
  }

  void choseAnswer(String answer) {
    selectedAnswerList.add(answer);
    if (selectedAnswerList.length == questionsList.length) {
      setState(() {
        activeScreen = ResultScreen(
          restartQuiz: restartQuiz,
          selectedAnswer: selectedAnswerList,
        );
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswerList = [];
      activeScreen = QuestionScreen(onSelectAnswer: choseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 228, 161, 98),
                  Color.fromARGB(255, 82, 217, 172),
                  Color.fromARGB(255, 82, 215, 217),
                  Color.fromARGB(255, 82, 163, 217),
                ],
              ),
            ),
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
