import 'package:flutter/cupertino.dart';

class VocabularyListColors {
  final bool isDarkMode;

  const VocabularyListColors({required this.isDarkMode});

  Color get pageBgColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFF7F7F7);
  Color get readyAktifColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFF409FFF);
  Color get readyPasifColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFD4EAFF);

  Color get myAktifColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFFF7D72);
  Color get myPasifColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFE7E5);

  Color get listAltIconColor =>
      isDarkMode ? const Color(0xFFB0B0B0) : const Color(0xFF606060);
  Color get noMyListTextColor =>
      isDarkMode ? const Color(0xFFB0B0B0) : const Color(0xFF606060);

  // Word List Item Colors
  Color get cardBgColor =>
      isDarkMode ? const Color(0xFF1E1E1E) : const Color(0xFFFFFFFF);
  Color get cardBoxShadowColor =>
      isDarkMode ? const Color(0xFF000000) : const Color(0x1A000000);
  Color get cardWordCountTextColor => isDarkMode
      ? const Color(0xFF9E9E9E)
      : const Color.fromARGB(255, 35, 149, 224);
  // level colors
  Color get beginnerLevelColor =>
      isDarkMode ? const Color(0xFF4CAF50) : const Color(0xFF4CAF50);
  Color get intermediateLevelColor =>
      isDarkMode ? const Color(0xFFFFC107) : const Color(0xFFFFC107);
  Color get advancedLevelColor =>
      isDarkMode ? const Color(0xFFF44336) : const Color(0xFFF44336);
  Color get levelTextColor =>
      isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);
  Color get defaultLevelColor => isDarkMode
      ? const Color(0xFFFFFFFF)
      : const Color.fromARGB(255, 88, 86, 86);
  // içerik colors
  Color get titleTextColor =>
      isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
  Color get subtitleTextColor =>
      isDarkMode ? const Color(0xFFB0B0B0) : const Color(0xFF606060);
  Color get categoryTextColor =>
      isDarkMode ? const Color(0xFF9E9E9E) : const Color(0xFF9E9E9E);

  // pogress bar colors
  Color get progressBarBgColor =>
      isDarkMode ? const Color(0xFF2C2C2C) : const Color(0xFFE0E0E0);

  // Create new list dialog colors
  Color get dialogBgColor =>
      isDarkMode ? const Color(0xFF1E1E1E) : const Color(0xFFFFFFFF);
}
