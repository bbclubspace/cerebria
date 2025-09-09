import 'package:flutter/cupertino.dart';

class ListeningColors {
  final bool isDarkMode;

  const ListeningColors({required this.isDarkMode});

  Color get pageBgColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFF7F7F7);
  Color get createContainerBgColor1 =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFF8F86);
  Color get createContainerBgColor2 =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFF8378);
  Color get createContainerBgColor3 =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFF7C71);
  Color get createContainerTextColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFDEAE9);
  Color get completedContainerBgColor1 =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFFF7C6);
  Color get completedContainerBgColor2 =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFFDDE2);
  Color get completedContainerBgColor3 =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFB7C4FF);

  Color get contentTitleTextColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFF000000);
  Color get itemTextColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFF282727);
  Color get itemLevelTextColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFF282727);
  Color get itemDurationTextColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFF282727);

  Color get lastExerciseContainerColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFEAF5FF);
}
