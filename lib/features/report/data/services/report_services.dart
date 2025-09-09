import 'dart:ui';

import '../model/report_model.dart';
import '../../../../core/constants/report_constants.dart';

class ReportServices {
  final List<Report> _reports = [];

  List<Report> getReports() {
    return List.unmodifiable(_reports);
  }

  void addReport(String title, DateTime date, List<Color> colors) {
    final startTime = DateTime(date.year, date.month, date.day, 9);
    final endTime = startTime.add(const Duration(hours: 1));

    final exists = _reports.any((r) =>
        r.title == title &&
        r.startTime.year == date.year &&
        r.startTime.month == date.month &&
        r.startTime.day == date.day);

    if (!exists) {
      _reports.add(
        Report(
          title,
          startTime,
          endTime,
          ReportConstants.getColorForContent(title,colors),
          false,
        ),
      );
    }
  }
}
