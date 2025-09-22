import 'package:cerebria/core/themes/exam/exam_colors.dart';
import 'package:cerebria/core/themes/grammer/grammer_colors.dart';
import 'package:cerebria/core/themes/listening/listening_colors.dart';
import 'package:cerebria/core/themes/ranking/ranking_colors.dart';
import 'package:cerebria/core/themes/reading/reading_colors.dart';
import 'package:cerebria/core/themes/report/report_colors.dart';
import 'package:cerebria/core/themes/speaking/speaking_colors.dart';
import 'package:cerebria/core/themes/vocabulary/vocabulary_colors.dart';
import 'package:cerebria/core/themes/vocabulary/vocabulary_list_color.dart';
import 'package:cerebria/core/themes/vocabulary/word_list_detail_color.dart';

import 'auth/auth_colors.dart';
import 'drawer/drawer_colors.dart';
import 'home/home_colors.dart';
import 'module/module_colors.dart';
import 'module/exercise_list_colors.dart';

class AppColors {
  final AuthColors auth;
  final HomeColors home;
  final DrawerColors drawer;
  final ModuleColors module;
  final ExerciseListColors exerciseList;
  final ReadingColors reading;
  // Vocabulary Colors
  final VocabularyColors vocabulary;
  final VocabularyListColors vocabularyList;
  final WordListDetailColor wordListDetail;

  final ListeningColors listening;
  final GrammerColors grammer;
  final SpeakingColors speaking;
  final ExamColors exam;
  final RankingColors ranking;
  final ReportColors report;

  AppColors({required bool isDarkMode})
    : auth = AuthColors(isDarkMode: isDarkMode),
      home = HomeColors(isDarkMode: isDarkMode),
      drawer = DrawerColors(isDarkMode: isDarkMode),
      module = ModuleColors(isDarkMode: isDarkMode),
      exerciseList = ExerciseListColors(isDarkMode: isDarkMode),
      reading = ReadingColors(isDarkMode: isDarkMode),
      // Vocabulary Colors
      vocabulary = VocabularyColors(isDarkMode: isDarkMode),
      vocabularyList = VocabularyListColors(isDarkMode: isDarkMode),
      wordListDetail = WordListDetailColor(isDarkMode: isDarkMode),

      listening = ListeningColors(isDarkMode: isDarkMode),
      grammer = GrammerColors(isDarkMode: isDarkMode),
      speaking = SpeakingColors(isDarkMode: isDarkMode),
      exam = ExamColors(isDarkMode: isDarkMode),
      ranking = RankingColors(isDarkMode: isDarkMode),
      report = ReportColors(isDarkMode: isDarkMode);
}
