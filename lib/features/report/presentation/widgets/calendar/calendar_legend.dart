import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/report_constants.dart';
import '../../../../../core/themes/app_colors.dart';

class CalendarLegend extends StatelessWidget {
  final List<Color> colorItem;

  const CalendarLegend({super.key, required this.colorItem});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      color: colors.report.calendarBgColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            ReportConstants.activityOptions.length,
            (index) {
              final item = ReportConstants.activityOptions[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: LegendItem(color: colorItem[index], title: item['title']),
              );
            },
          ),
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String title;

  const LegendItem({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 7.h, height: 7.h, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        SizedBox(width: 5.w),
        Text(title, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }
}
