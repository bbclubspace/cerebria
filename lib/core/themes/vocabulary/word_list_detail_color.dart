import 'package:flutter/cupertino.dart';

class WordListDetailColor {
  final bool isDarkMode;

  const WordListDetailColor({required this.isDarkMode});

  Color get pageBgColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFF7F7F7);
}
