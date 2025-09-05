import 'package:cerebria/themes/exam/exam_colors.dart';
import 'package:cerebria/themes/grammer/grammer_colors.dart';
import 'package:cerebria/themes/listening/listening_colors.dart';
import 'package:cerebria/themes/ranking/ranking_colors.dart';
import 'package:cerebria/themes/reading/reading_colors.dart';
import 'package:cerebria/themes/speaking/speaking_colors.dart';
import 'package:cerebria/themes/vocabulary/vocabulary_colors.dart';
import 'auth/auth_colors.dart';
import 'drawer/drawer_colors.dart';
import 'home/home_colors.dart';
import 'module/module_colors.dart';

class AppColors {
  final AuthColors auth;
  final HomeColors home;
  final DrawerColors drawer;
  final ModuleColors module;
  final ReadingColors reading;
  final VocabularyColors vocabulary;
  final ListeningColors listening;
  final GrammerColors grammer;
  final SpeakingColors speaking;
  final ExamColors exam;
  final RankingColors ranking;

  AppColors({required bool isDarkMode})
    : auth = AuthColors(isDarkMode: isDarkMode),
      home = HomeColors(isDarkMode: isDarkMode),
      drawer = DrawerColors(isDarkMode: isDarkMode),
      module = ModuleColors(isDarkMode: isDarkMode),
      reading = ReadingColors(isDarkMode: isDarkMode),
      vocabulary = VocabularyColors(isDarkMode: isDarkMode),
      listening = ListeningColors(isDarkMode: isDarkMode),
      grammer = GrammerColors(isDarkMode: isDarkMode),
      speaking = SpeakingColors(isDarkMode: isDarkMode),
      exam = ExamColors(isDarkMode: isDarkMode),
      ranking = RankingColors(isDarkMode: isDarkMode);
}
