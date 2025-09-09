import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'report_model.dart';

class ReportDataSource extends CalendarDataSource {
  ReportDataSource(List<Report> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => appointments![index].startTime;

  @override
  DateTime getEndTime(int index) => appointments![index].endTime;

  @override
  String getSubject(int index) => appointments![index].title;

  @override
  Color getColor(int index) => appointments![index].color;

  @override
  bool isAllDay(int index) => appointments![index].isAllDay;
}
