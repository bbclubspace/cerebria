import 'package:bloc/bloc.dart';
import '../../data/model/quiz_item.dart';
import 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState(isEmpty: true));

  void selectAnswer(String answer) {
    emit(state.copyWith(
      selectedAnswer: answer,
      isEmpty: false,
    ));
  }

  bool checkAnswer() {
    if (state.selectedAnswer == null) {
      return false;
    }

    final currentQuestion = QuestionData.questions[state.currentIndex];
    bool correct = state.selectedAnswer == currentQuestion.correctAnswer;

    emit(state.copyWith(
      showCorrectAnswer: true,
      isCorrect: correct,
      isEmpty: false,
      selectedAnswer: state.selectedAnswer,
    ));

    return true;
  }

  void nextQuestion() {
    int nextIndex = state.currentIndex < QuestionData.questions.length - 1
        ? state.currentIndex + 1
        : 0;

    emit(state.copyWith(
      currentIndex: nextIndex,
      selectedAnswer: null,
      showCorrectAnswer: false,
      isCorrect: null,
      isEmpty: true,
    ));
  }
}