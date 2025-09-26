class QuizState {
  final int currentIndex;
  final String? selectedAnswer;
  final bool showCorrectAnswer;
  final bool? isCorrect;
  final bool isEmpty;

  QuizState({
    this.currentIndex = 0,
    this.selectedAnswer,
    this.showCorrectAnswer = false,
    this.isCorrect,
    this.isEmpty = true,
  });

  QuizState copyWith({
    int? currentIndex,
    String? selectedAnswer,
    bool? showCorrectAnswer,
    bool? isCorrect,
    bool? isEmpty,
  }) {
    return QuizState(
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswer: selectedAnswer,
      showCorrectAnswer: showCorrectAnswer ?? this.showCorrectAnswer,
      isCorrect: isCorrect,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }
}
