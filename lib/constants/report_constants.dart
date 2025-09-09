import 'package:cerebria/model/report/report_item.dart';
import 'package:cerebria/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../model/exam_weakness.dart';

class ReportConstants {
  final colors = AppColors(isDarkMode: false);
  static final List<Map<String, dynamic>> activityOptions = [
    {"title": "Reading", "icon": Icons.menu_book_rounded},
    {"title": "Writing", "icon": Icons.edit_note_rounded},
    {"title": "Speaking", "icon": Icons.mic_rounded},
    {"title": "Vocabulary", "icon": Icons.language_rounded},
  ];

  static Color getColorForContent(String content, List<Color> colors) {
    switch (content) {
      case "Reading":
        return colors[0];
      case "Writing":
        return colors[1];
      case "Speaking":
        return colors[2];
      case "Vocabulary":
        return colors[3];
      default:
        return colors[0];
    }
  }

static List<ReportItem> getReportItem(AppColors colors) {
  return [
    ReportItem(
      iconPath: "assets/homepage-icon/high-score.png",
      title: "Questions",
      value: "250.000",
      bgColor: colors.home.rankContainerColor1,
    ),
    ReportItem(
      iconPath: "assets/homepage-icon/daily.png",
      title: "Working Hours",
      value: "1350",
      bgColor: colors.home.rankContainerColor2,
    ),
    ReportItem(
      iconPath: "assets/homepage-icon/ranking.png",
      title: "Best Series",
      value: "20",
      bgColor: colors.home.rankContainerColor3,
    ),
  ];
}

  static List<ExamWeakness> examples = [
    ExamWeakness("Conditionals", "12", 0.75),
    ExamWeakness("Passive Voice", "12", 0.60),
    ExamWeakness("Relative Clauses", "12", 0.45),
    ExamWeakness("Modal Verbs", "12", 0.30),
    ExamWeakness("Past Perfect", "12", 0.45),
    ExamWeakness("Simple Present", "12", 0.30),
  ];

}
