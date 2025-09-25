class QuizItem {
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizItem({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

class QuestionData {
  static List<QuizItem> questions = [
    QuizItem(
      question: "I go to school every day.",
      options: ["Okula gidiyorum", "Okula gitmiyorum", "Okula gittim", "Okula gidiyor"],
      correctAnswer: "Okula gidiyorum",
    ),
    QuizItem(
      question: "She drinks water.",
      options: ["O su içiyor", "O su içmiyor", "O su içti", "O su içiyor musun"],
      correctAnswer: "O su içiyor",
    ),
    QuizItem(
      question: "They play football.",
      options: ["Onlar futbol oynuyor", "Onlar futbol oynamıyor", "Onlar futbol oynadı", "Onlar futbol oynayacak"],
      correctAnswer: "Onlar futbol oynuyor",
    ),
    QuizItem(
      question: "He is reading a book.",
      options: ["O bir kitap okuyor", "O kitap okumuyor", "O kitap okudu", "O kitap okuyacak"],
      correctAnswer: "O bir kitap okuyor",
    ),
    QuizItem(
      question: "We are watching TV.",
      options: ["Biz televizyon izliyoruz", "Biz televizyon izlemiyoruz", "Biz televizyon izledik", "Biz televizyon izleyeceğiz"],
      correctAnswer: "Biz televizyon izliyoruz",
    ),
  ];
}


