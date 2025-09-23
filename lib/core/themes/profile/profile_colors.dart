import 'package:flutter/cupertino.dart';

class ProfileColors {
  final bool isDarkMode;

  const ProfileColors({required this.isDarkMode});

  Color get pageBgColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFF7F7F7);
 
 Color get headerContainerFirstColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFD36EFA);
       Color get headerContainerSecondColor =>
      isDarkMode ? const Color(0xFF121212) : const Color(0xFFBE1CFF);

  Color get circleContainerFirstColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFE092FF);
  Color get circleContainerSecondColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFD78DF4);
  Color get circleContainerThirdColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFD78DF4);

  Color get profileContainerBgColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFFFFFF);
  Color get profileContainerStrokeColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFDD8046);
  
  Color get containerBgColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFFFFFF);
  
  Color get pageSubtextColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFF000000);
  Color get pagePrimaryTextColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFF282727);
  
  Color get containerShadowColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFCD75F0);
  
  Color get deleteButtonStrokeColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFA023FF);

    
  Color get updateButtonFirstColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFA023FF);
  Color get updateButtonSecondColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFE8B3FC);
  Color get updateButtonTextColor =>
      isDarkMode ? const Color(0xFF333333) : const Color(0xFFFFFFFF);
}

