import 'package:flutter/cupertino.dart';

class VocabularyColors {
  final bool isDarkMode;

  const VocabularyColors({required this.isDarkMode});

  Color get pageBgColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFF7F7F7);
  Color get createContainerBgColor1 =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFF82F562);
  Color get createContainerBgColor2 =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFF83EE65);
  Color get createContainerBgColor3 =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFF82E666);
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

  //exercise page colors
  Color get exerciseTopContainerColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFEE5D6);

  Color get exerciseItemContainerBgColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFFFFFF);
  Color get exerciseItemContainerShadowColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFF9FF088);

  Color get exerciseItemSelectedColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFD8DAD7);

  Color get exerciseItemCorrectBorderColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFF9FF088);

  Color get exerciseItemWrongBorderColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFF5722);

  Color get exerciseItemCorrectBgColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFC2F3B5);
  Color get exerciseItemWrongBgColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFC9777);
}
