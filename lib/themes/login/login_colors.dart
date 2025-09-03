import 'package:flutter/cupertino.dart';

class LoginColors {
  final bool isDarkMode;

  const LoginColors({required this.isDarkMode});

  Color get pageBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFF7F7F7);
  Color get titleTextColor => isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
  Color get textFieldStrokeColor => isDarkMode ? const Color(0xFF888888) : const Color(0xFFC8C8C8);
  Color get textFieldBgColor => isDarkMode ? const Color(0xFF222222) : const Color(0xFFFFFFFF);
  Color get buttonTextColor => const Color(0xFFFFFFFF); // İki modda da aynı
  Color get buttonBgColor => isDarkMode ? const Color(0xFF7A1BCC) : const Color(0xFFA023FF);
  Color get buttonStrokeColor => isDarkMode ? const Color(0xFF555555) : const Color(0xFFC8C8C8);
  Color get orContinueSocialButtonColor => isDarkMode ? const Color(0xFFAAAAAA) : const Color(0xFF737373);
  Color get googleSignInBgColor => isDarkMode ? const Color(0xFF333333) : const Color(0xFFFFFFFF);
  Color get googleSignInTextColor => isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF181717);
  Color get googleSignInStrokeColor => isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFFD2D2D2);
  Color get appleSignInBgColor => const Color(0xFF000000);
  Color get appleSignInTextColor => const Color(0xFFFFFFFF);
}
