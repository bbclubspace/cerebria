import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubit/report/report_cubit.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/date_utils.dart';
import '../../../constants/report_constants.dart';

class CalendarCellWidget extends StatelessWidget {
  final DateTime date;
  final ReportsCubit cubit;
  final AppColors colors;
  final List<Color> colorItem;

  const CalendarCellWidget({
    super.key,
    required this.date,
    required this.cubit,
    required this.colors,
    required this.colorItem,
  });

  @override
  Widget build(BuildContext context) {
    final isToday = DateUtilsHelper.isToday(date);
    final appointmentsForDate = DateUtilsHelper.getAppointmentsForDate(
      cubit.state.reports,
      date,
      (m) => m.startTime,
    );
    final uniqueContentTypes = appointmentsForDate.map((a) => a.title).toSet().toList();

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(5.w),
      margin: EdgeInsets.all(1.w),
      decoration: BoxDecoration(
        color: isToday ? colors.report.calendarNowdateContainerColor : Colors.white,
        border: appointmentsForDate.isNotEmpty
            ? Border.all(
                color: colors.report.calendarAddedStrokeColor,
                width: 2,
              )
            : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            '${date.day}',
            style: TextStyle(
              color: isToday ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
          if (uniqueContentTypes.isNotEmpty) SizedBox(height: 2.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: uniqueContentTypes.map((type) {
                  return Container(
                    width: 5.h,
                    height: 5.h,
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    decoration: BoxDecoration(
                      color: ReportConstants.getColorForContent(type, colorItem),
                      shape: BoxShape.circle,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
