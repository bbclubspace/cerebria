class FlashCardState {
  final int currentIndex;
  final bool isFront;

  FlashCardState({
    this.currentIndex = 0,
    this.isFront = true,
  });

  FlashCardState copyWith({
    int? currentIndex,
    bool? isFront,
  }) {
    return FlashCardState(
      currentIndex: currentIndex ?? this.currentIndex,
      isFront: isFront ?? this.isFront,
    );
  }
}
