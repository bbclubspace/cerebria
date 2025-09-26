import 'package:bloc/bloc.dart';
import '../../data/model/writing_item.dart';
import 'writing_state.dart';

class WritingCubit extends Cubit<WritingState> {
  WritingCubit() : super(WritingState.initial());

  void checkAnswer(String answer) {
    final correctAnswer = state.currentWord.correctAnswer.trim().toLowerCase();
    final userAnswer = answer.trim().toLowerCase();

    if (userAnswer.isEmpty) {
      emit(
        state.copyWith(
          isCorrect: false,
          isCompleted: false,
          userAnswer: '',
          isEmpty: true,
        ),
      );
      return;
    }
    if (userAnswer == correctAnswer) {
      int nextIndex = state.currentWordIndex + 1;
      bool completed = false;

      if (nextIndex >= WritingData.writingData.length) {
        nextIndex = 0;
        completed = true;
      }

      emit(
        state.copyWith(
          isCorrect: true,
          isCompleted: completed,
          currentWordIndex: nextIndex,
          currentWord: WritingData.writingData[nextIndex],
          userAnswer: '',
          isEmpty: false,
        ),
      );
    } else {
      emit(
        state.copyWith(isCorrect: false, isCompleted: false, isEmpty: false),
      );
    }
  }

  void reset() {
    emit(WritingState.initial());
  }
}
