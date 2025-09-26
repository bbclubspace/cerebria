import '../../data/model/writing_item.dart';

class WritingState {
  final int currentWordIndex;
  final String userAnswer;
  final bool isCorrect;
  final bool isCompleted;
  final Writing currentWord;
  final bool isEmpty;

  WritingState({
    required this.currentWordIndex,
    required this.userAnswer,
    required this.isCorrect,
    required this.isCompleted,
    required this.currentWord,
    required this.isEmpty,
  });

  factory WritingState.initial() {
    return WritingState(
      currentWordIndex: 0,
      userAnswer: '',
      isCorrect: false,
      isCompleted: false,
      currentWord: WritingData.writingData[0],
      isEmpty: false
    );
  }

  WritingState copyWith({
    int? currentWordIndex,
    String? userAnswer,
    bool? isCorrect,
    bool? isCompleted,
    Writing? currentWord,
    bool? isEmpty,
  }) {
    return WritingState(
      currentWordIndex: currentWordIndex ?? this.currentWordIndex,
      userAnswer: userAnswer ?? this.userAnswer,
      isCorrect: isCorrect ?? this.isCorrect,
      isCompleted: isCompleted ?? this.isCompleted,
      currentWord: currentWord ?? this.currentWord,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }
}
