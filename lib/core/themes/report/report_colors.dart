import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportColors {
  final bool isDarkMode;

  const ReportColors({required this.isDarkMode});

  Color get pageBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFF7F7F7);
  Color get calendarBgColor =>isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get calendarNowdateContainerColor =>isDarkMode ? const Color(0xFF121212) : const Color(0xFF20B9F2);
  Color get calendarAddedStrokeColor =>isDarkMode ? const Color(0xFF121212) : const Color(0xFF20B9F2);

  Color get calendarItemColor1 =>isDarkMode ? const Color(0xFF121212) : const Color(0xFF2196f3);
  Color get calendarItemColor2 =>isDarkMode ? const Color(0xFF121212) : const Color(0xFF4CAF50);
  Color get calendarItemColor3 =>isDarkMode ? const Color(0xFF121212) : const Color(0xFFFF9800);
  Color get calendarItemColor4 =>isDarkMode ? const Color(0xFF121212) : const Color(0xFF9C27B0);
  
  Color get circleProgressColor =>isDarkMode ? const Color(0xFF121212) : const Color(0xFF0D8B49);
  Color get circleProgressBgColor =>isDarkMode ? const Color(0xFF121212) : const Color(0xFFCDCDCD);

  Color get grammerWeakContainerBgColor1 =>isDarkMode ? const Color(0xFF121212) : const Color(0xFFB456FB);
  Color get grammerWeakContainerBgColor2 =>isDarkMode ? const Color(0xFF121212) : const Color(0xFFB973EF);
  Color get grammerWeakContainerBgColor3 =>isDarkMode ? const Color(0xFF121212) : const Color(0xFFB470E9);


  Color get quetionTypeContainerBgColor1 =>isDarkMode ? const Color(0xFF121212) : const Color(0xFFD9C1AD);
  Color get quetionTypeContainerBgColor2 =>isDarkMode ? const Color(0xFF121212) : const Color(0xFFE9C2A2);
  Color get quetionTypeContainerBgColor3 =>isDarkMode ? const Color(0xFF121212) : const Color(0xFFE4C9B3);

  Color get containerTextColor =>isDarkMode ? const Color(0xFF121212) : const Color(0XFFFFFFFF);

  Color get progressBgColor =>isDarkMode ? const Color(0xFF121212) : const Color.fromARGB(73, 255, 255, 255);
  Color get progressColor =>isDarkMode ? const Color(0xFF121212) : const Color(0XFFFFFFFF);

  Color get bottomSheetBgColor =>isDarkMode ? const Color(0xFF121212) :   Colors.transparent;
  Color get bottomSheetContainerColor =>isDarkMode ? const Color(0xFF121212) :   Colors.white;
  Color get bottomSheetContentContainerColor =>isDarkMode ? const Color(0xFF121212) :   const Color.fromARGB(255, 229, 229, 229);
  Color get bottomSheetTitleTextColor =>isDarkMode ? const Color(0xFF121212) :   Colors.black87;



    List<Color> get grammarWeakColors => [
        grammerWeakContainerBgColor1,
        grammerWeakContainerBgColor2,
        grammerWeakContainerBgColor3,
      ];

  List<Color> get questionTypeColors => [
        quetionTypeContainerBgColor1,
        quetionTypeContainerBgColor1,
        quetionTypeContainerBgColor1,
      ];

  List<Color> get calendarColors => [
        calendarItemColor1,
        calendarItemColor2,
        calendarItemColor3,
        calendarItemColor4,
      ];
}
