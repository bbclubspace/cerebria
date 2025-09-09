import 'package:cerebria/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearProgressBar extends StatelessWidget {
  final double value;
  final AppColors colors;

  const LinearProgressBar({
    super.key,
    required this.value,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 175.w,
        height: 10.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: colors.report.progressBgColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              colors.report.progressColor,
            ),
          ),
        ),
      ),
    );
  }
}