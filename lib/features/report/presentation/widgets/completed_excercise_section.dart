import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/container/rank_and_ach_container.dart';
import '../../../module/presentation/widgets/title_text.dart';

class CompletedExerciseSection extends StatelessWidget {
  final AppColors colors;
  final List ranks;

  const CompletedExerciseSection({super.key, required this.colors, required this.ranks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(colors: colors, title: "Completed Exercise"),
                  SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: SizedBox(
            height: 90.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: ranks.length,
              separatorBuilder: (_, __) => SizedBox(width: 17.w),
              itemBuilder: (context, index) {
                final item = ranks[index];
                return RankAndAchContainer(
                  colors: colors,
                  bgColor: item.bgColor,
                  iconPath: item.iconPath,
                  title: item.title,
                  value: item.value,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
