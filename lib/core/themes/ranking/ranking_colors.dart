import 'package:flutter/cupertino.dart';

class RankingColors {
  final bool isDarkMode;

  const RankingColors({required this.isDarkMode});

  Color get pageBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFF7F7F7);
  Color get weeklyContainerColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFF7C6);
  Color get monthlyContainerColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFDDE2);
  Color get allTimesContainerColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFB7C4FF);
  Color get timesTextColor => isDarkMode ? const Color(0xFF121212): const Color(0xFF282727);
  Color get strokeColor => isDarkMode ? const Color(0xFF121212) : const Color.fromARGB(255, 169, 169, 169);
  Color get topRankTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFA023FF);
  Color get topRankNameTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF282727);
  Color get topRankContainerColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF75A8DE);

  Color get rankContainerBgColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get rankNameTextColor => isDarkMode ? const Color.fromARGB(255, 81, 81, 81) : const Color(0xFF282727);
  Color get rankLevelTextColor => isDarkMode ? const Color(0xFF121212): const Color.fromARGB(255, 132, 131, 131);
  Color get rankStatusBgColor => isDarkMode ? const Color.fromARGB(255, 81, 81, 81) : const Color(0xFFE3F2FD);
  Color get rankStatusTextColor => isDarkMode ? const Color.fromARGB(255, 81, 81, 81) : const Color(0xFF4DABF5);
  Color get rankPointTextColor => isDarkMode ? const Color(0xFF121212) : const Color(0xFF73BCF7);
  Color get rankPointPositiveChange => isDarkMode ? const Color(0xFF121212) : const Color(0xFF5BB65F);
  Color get rankPointNegativeChange => isDarkMode ? const Color(0xFF121212) : const Color(0xFFF5554A);


}
