import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/utils/font_size.dart';
import '../../../../../data/model/writing_item.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    super.key,
    required this.appColors,
    required this.word,
  });

  final AppColors appColors;
  final Writing word;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 289.w,
      height: 87.h,
      decoration: BoxDecoration(
        color: appColors.vocabulary.exerciseItemContainerBgColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: appColors.vocabulary.exerciseItemContainerShadowColor,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              word.word,
              style: TextStyle(
                fontSize: AppFontSizes.s30,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              word.turkishSentence,
              style: TextStyle(
                fontSize: AppFontSizes.s16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
