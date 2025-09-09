import 'package:cerebria/features/report/presentation/widgets/statistics/statistics_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../data/model/exam_weakness.dart';
import '../../../../module/presentation/widgets/title_text.dart';

class GrammaticalWeaknessSection extends StatelessWidget {
  final AppColors colors;
  final List<Color> colorsList;
  final List<ExamWeakness> contentList;

  const GrammaticalWeaknessSection({
    super.key,
    required this.colors,
    required this.colorsList,
    required this.contentList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        TitleText(colors: colors, title: "Grammatical Weakness"),
        SizedBox(height: 5.h),
        SizedBox(height: 7.h),
        Center(
          child: StatisticsContainer(
            colorsList: colorsList,
            appColors: colors,
            contentList: contentList,
          ),
        ),
      ],
    );
  }
}




