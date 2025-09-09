import 'package:cerebria/features/report/presentation/widgets/statistics/linear_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/model/exam_weakness.dart';
import '../../../../../core/themes/app_colors.dart';

class StatisticsContainer extends StatelessWidget {
  final List<Color> colorsList;
  final AppColors appColors;
  final List<ExamWeakness> contentList;

  const StatisticsContainer({
    super.key,
    required this.colorsList,
    required this.appColors,
    required this.contentList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 347.w,
      height: 341.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorsList,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: contentList.length,
        itemBuilder: (context, index) {
          final item = contentList[index];
          return Padding(
            padding: EdgeInsets.only(left: 20.w, top: 15.h, right: 20.w),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          color: appColors.report.containerTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "${item.wrongAnswer} wrong answer",
                        style: TextStyle(
                          color: appColors.report.containerTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  flex: 3,
                  child: LinearProgressBar(
                    value: item.value,
                    colors: appColors,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}