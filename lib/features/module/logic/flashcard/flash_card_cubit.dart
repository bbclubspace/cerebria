import 'package:bloc/bloc.dart';
import '../../data/model/word_item.dart';
import 'flash_card_state.dart';

class FlashCubit extends Cubit<FlashCardState> {
  FlashCubit() : super(FlashCardState());

  void toggleCard() {
    emit(state.copyWith(isFront: !state.isFront));
  }

  void nextCard() {
    int nextIndex = (state.currentIndex + 1) % wordData.length;
    emit(state.copyWith(currentIndex: nextIndex, isFront: true));
  }
}
