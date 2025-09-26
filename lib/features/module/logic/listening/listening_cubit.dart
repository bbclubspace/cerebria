import 'package:bloc/bloc.dart';
import 'listening_state.dart';

class ListeningCubit extends Cubit<ListeningState> {
  ListeningCubit() : super(ListeningState());

  void submitAnswer(String answer) {
    emit(state.copyWith(userAnswer: answer, submitted: true));
  }

  void reset() {
    emit(ListeningState());
  }
}
