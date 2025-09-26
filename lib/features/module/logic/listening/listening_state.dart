class ListeningState {
  final String userAnswer;
  final bool submitted;

  ListeningState({
    this.userAnswer = '',
    this.submitted = false,
  });

  ListeningState copyWith({
    String? userAnswer,
    bool? submitted,
  }) {
    return ListeningState(
      userAnswer: userAnswer ?? this.userAnswer,
      submitted: submitted ?? this.submitted,
    );
  }
}
