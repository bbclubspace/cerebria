import 'package:intl/intl.dart';

class DateUtilsHelper {
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static String formatDate(DateTime date, {String pattern = "dd MMM yyyy"}) {
    return DateFormat(pattern).format(date);
  }

  static List<T> getAppointmentsForDate<T>(
    List<T> items,
    DateTime date,
    DateTime Function(T) getDate,
  ) {
    return items.where((item) => isSameDay(getDate(item), date)).toList();
  }
}
