import 'package:cerebria/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashCardContent extends StatelessWidget {
  final Widget child;
  final AppColors appColors;
  const FlashCardContent({Key? key, required this.child, required this.appColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 289.w,
      height: 377.h,
      decoration: BoxDecoration(
        color: appColors.vocabulary.exerciseItemContainerBgColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: appColors.vocabulary.exerciseItemContainerShadowColor,
            blurRadius: 4.r,
            spreadRadius: 0.5.r,
            offset: Offset(3.w, 3.h),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
