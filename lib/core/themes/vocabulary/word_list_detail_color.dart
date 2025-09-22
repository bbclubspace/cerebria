import 'package:flutter/cupertino.dart';

class WordListDetailColor {
  final bool isDarkMode;

  const WordListDetailColor({required this.isDarkMode});

  Color get pageBgColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFF7F7F7);

  Color get exerciseTypesTextColor =>
      isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
  //  word_list_header_card renkleri
  Color get boxDecorationColor =>
      isDarkMode ? const Color(0xFF1E1E1E) : const Color(0xFFFFFFFF);

  Color get textColor =>
      isDarkMode ? const Color(0xFF000000) : const Color(0xFFFFFFFF);

  Color get iconColor =>
      isDarkMode ? const Color(0xFF000000) : const Color(0xFFFFFFFF);
}
