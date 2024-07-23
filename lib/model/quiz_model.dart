class QuizData {
  QuizData({required this.questions, required this.answers});
  final String questions;
  final List<String> answers;

  List<String> get getShuffledAnswers {
    final shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
