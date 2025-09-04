import 'package:flutter/cupertino.dart';

class DrawerColors {
  final bool isDarkMode;

  const DrawerColors({required this.isDarkMode});

  Color get pageBgColor1 => isDarkMode ? const Color(0xFF121212) : const Color(0xFFCA86FF);
  Color get pageBgColor2 => isDarkMode ? const Color(0xFF121212) : const Color(0xFFB872EE);
  Color get pageBgColor3 => isDarkMode ? const Color(0xFF121212) : const Color(0xFFB671EB);
  Color get pageBgColor4 => isDarkMode ? const Color(0xFF121212) : const Color(0xFFB04FFA);
  Color get textColor => isDarkMode ? const Color(0xFFFFFFFF)  : const Color(0xFFFFFFFF);

}
