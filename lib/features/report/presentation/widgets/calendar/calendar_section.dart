import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../logic/cubit/report_cubit.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../data/model/report_datasource.dart';
import 'calendar_cell_widget.dart';
import 'calendar_legend.dart';
import '../content_selector_bottomsheet.dart';

class CalendarSection extends StatelessWidget {
  const CalendarSection({
    super.key,
    required this.colors,
    required this.colorItem,
    required this.cubit,
  });

  final AppColors colors;
  final List<Color> colorItem;
  final ReportsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 370.h,
      child: Column(
        children: [
          Expanded(
            child: SfCalendar(
              view: CalendarView.month,
              backgroundColor: colors.report.calendarBgColor,
              headerStyle: CalendarHeaderStyle(
                backgroundColor: colors.report.calendarBgColor,
              ),
              dataSource: ReportDataSource(cubit.state.reports),
              monthViewSettings: const MonthViewSettings(
                numberOfWeeksInView: 6,
                showTrailingAndLeadingDates: true,
                appointmentDisplayMode: MonthAppointmentDisplayMode.none,
              ),
              monthCellBuilder: (context, details) {
                return CalendarCellWidget(
                  date: details.date,
                  cubit: cubit,
                  colors: colors,
                  colorItem: colorItem,
                );
              },
              onTap: (details) async {
                if (details.targetElement == CalendarElement.calendarCell) {
                  final selectedDate = details.date!;
                  final selectedContent = await ContentSelectorBottomSheet.show(
                    context,
                    colorItem,
                  );

                  if (selectedContent != null) {
                    cubit.addReport(selectedContent, selectedDate, colorItem);
                  }
                }
              },
            ),
          ),
          CalendarLegend(colorItem: colorItem),
        ],
      ),
    );
  }
}
