import 'package:flutter/cupertino.dart';

class HomeColors {
  final bool isDarkMode;

  const HomeColors({required this.isDarkMode});

  Color get pageBgColor1 => isDarkMode ? const Color(0xFF1E1E1E) : const Color(0xFFF6F6F6);
  Color get pageBgColor2 => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get menuButtonBgColor => isDarkMode ? const Color(0xFF2A2A2A) : const Color(0xFFFFFFFF);
  Color get appNameTextColor => isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
  Color get mainContainerColor1 => isDarkMode ? const Color(0xFF8F3BCE) : const Color(0xFFB456FB);
  Color get mainContainerColor2 => isDarkMode ? const Color(0xFF9244E0) : const Color(0xFFB973EF);
  Color get mainContainerColor3 => isDarkMode ? const Color(0xFF8349D3) : const Color(0xFFB470E9);
  Color get mainContainerTextColor => const Color(0xFFFFFFFF);
  Color get statusBarStartColor => isDarkMode ? const Color(0xFF222222) : const Color(0xFFFFFFFF);
  Color get statusBarEndColor => isDarkMode ? const Color(0xFF333333) : const Color(0xFFE0B7FF);
  Color get titleTextColor => isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
  Color get rankTextColor => isDarkMode ? const Color(0xFFDCDCDC) : const Color(0xFF282727);
  Color get rankContainerColor1 => isDarkMode ? const Color(0xFF444444) : const Color(0xFFFFF7C6);
  Color get rankContainerColor2 => isDarkMode ? const Color(0xFF555555) : const Color(0xFFFFDDE2);
  Color get rankContainerColor3 => isDarkMode ? const Color(0xFF666666) : const Color(0xFFB7C4FF);
}
