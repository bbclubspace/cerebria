class Writing {
  final String word;
  final String answer;
  final String correctAnswer;
  final String turkishSentence;

  Writing({
    required this.word,
    required this.answer,
    required this.correctAnswer,
    required this.turkishSentence,
  });

}
class WritingData{
  static final List<Writing> writingData = [
  Writing(
    word: "GO",
    answer: "Gitmek",
    correctAnswer: "I am going to school today",
    turkishSentence: "Bugün okula gidiyorum",
  ),
  Writing(
    word: "COME",
    answer: "Gelmek",
    correctAnswer: "I am coming home now",
    turkishSentence: "Şimdi eve geliyorum",
  ),
  Writing(
    word: "SEE",
    answer: "Görmek",
    correctAnswer: "I am seeing a movie tonight",
    turkishSentence: "Bu gece bir film izliyorum",
  ),
  Writing(
    word: "EAT",
    answer: "Yemek",
    correctAnswer: "I am eating breakfast",
    turkishSentence: "Ben kahvaltı yapıyorum",
  ),
  Writing(
    word: "DRINK",
    answer: "İçmek",
    correctAnswer: "I am drinking water",
    turkishSentence: "Ben su içiyorum",
  ),
];
}