import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cerebria/core/utils/font_size.dart';
import '../../../../../../core/themes/app_colors.dart';

class CardTop extends StatelessWidget {
  final String title;
  final AppColors appColors;
  const CardTop({Key? key, required this.title, required this.appColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: appColors.vocabulary.exerciseTopContainerColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: AppFontSizes.s14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
