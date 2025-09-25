import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';

class EarnedBadges extends StatelessWidget {
  const EarnedBadges({
    super.key,
    required this.appColors,
    required this.months,
    required this.badges,
  });

  final AppColors appColors;
  final List<String> months;
  final List<String> badges;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355.w,
      height: 116.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: appColors.profile.containerBgColor,
        boxShadow: [
          BoxShadow(
            color: appColors.profile.containerShadowColor,
            blurRadius: 4.r,
            spreadRadius: 0.5.r,
            offset: Offset(3.w, 3.h),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, left: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardTitleText(),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _badgesDetailCard(months[0], badges[0]),
                SizedBox(width: 15.w),
                _badgesDetailCard(months[1], badges[1]),
                SizedBox(width: 15.w),
                _badgesDetailCard(months[2], badges[2]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text _cardTitleText() {
    return Text(
      "Earned Badges",
      style: TextStyle(
        color: appColors.profile.pagePrimaryTextColor,
        fontSize: AppFontSizes.s16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Column _badgesDetailCard(String month, String badge) {
    return Column(
      children: [
        Image.asset(badge),
        SizedBox(height: 4.h),
        Text(
          month,
          style: TextStyle(
            color: appColors.profile.pageSubtextColor,
            fontSize: AppFontSizes.s12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
