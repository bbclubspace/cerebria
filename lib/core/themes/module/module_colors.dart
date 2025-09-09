import 'package:flutter/cupertino.dart';

class ModuleColors {
  final bool isDarkMode;

  const ModuleColors({required this.isDarkMode});

  Color get pageBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFF7F7F7);
  Color get moduleContainerColor1 => isDarkMode ? const Color(0xFF333333) : const Color(0xFFEAF5FF);
  Color get moduleContainerColor2 => isDarkMode ? const Color(0xFF3A3A3A) : const Color(0xFFFFE7E5);
  Color get moduleContainerColor3 => isDarkMode ? const Color(0xFF444444) : const Color(0xFFF4E7FF);
  Color get moduleContainerColor4 => isDarkMode ? const Color(0xFF555555) : const Color(0xFFFEE5D6);
  Color get moduleContainerColor5 => isDarkMode ? const Color(0xFF555555) : const Color(0xFF9FF088);
  Color get moduleContainerColor6 => isDarkMode ? const Color(0xFF555555) : const Color(0xFFE7DBD1);
  Color get moduleContainerTextColor => isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF282727);
  Color get titleTextColor => isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF000000);


}
