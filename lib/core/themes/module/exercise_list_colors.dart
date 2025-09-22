import 'package:flutter/cupertino.dart';

class ExerciseListColors {
  final bool isDarkMode;

  const ExerciseListColors({required this.isDarkMode});

  Color get pageBgColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFF7F7F7);

  Color get creditCardColor =>
      isDarkMode ? const Color(0xFF1E1E1E) : const Color(0xFF2196F3);
  Color get quizColor =>
      isDarkMode ? const Color(0xFF2E7D32) : const Color(0xFF81C784);
  Color get eslestirmeColor =>
      isDarkMode ? const Color(0xFF6A1B9A) : const Color(0xFFBA68C8);
  Color get writingColor =>
      isDarkMode ? const Color(0xFFEF6C00) : const Color(0xFFFFB74D);
  Color get dinlemeColor =>
      isDarkMode ? const Color(0xFF455A64) : const Color(0xFF90A4AE);
}
