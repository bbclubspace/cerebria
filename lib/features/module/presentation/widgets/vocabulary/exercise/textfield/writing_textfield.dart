import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/utils/font_size.dart';

class WritingTextfield extends StatelessWidget {
  const WritingTextfield({
    super.key,
    required this.appColors,
    required this.answerController,
  });

  final AppColors appColors;
  final TextEditingController answerController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: appColors.vocabulary.exerciseItemContainerBgColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: appColors.vocabulary.exerciseItemContainerShadowColor,
        ),
      ),
      child: Center(
        child: TextField(
          controller: answerController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Type your answer here...",
          ),
          maxLines: 2,
          style: TextStyle(
            fontSize: AppFontSizes.s16,
          ),
        ),
      ),
    );
  }
}