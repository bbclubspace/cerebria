import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:cerebria/core/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeGreeting extends StatelessWidget {
  final AppColors colors;
  final String username;
  final String subtitle;
  final String dailyGoalStatus;

  const HomeGreeting({
    Key? key,
    required this.colors,
    required this.username,
    required this.subtitle,
    required this.dailyGoalStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Kullanıcı ismi
        Text(
          "Hello $username",
          style: TextStyle(
            color: colors.home.mainContainerTextColor,
            fontSize: AppFontSizes.s22,
            fontWeight: FontWeight.w700,
          ),
        ),
         SizedBox(height: 5.h),

        // Alt başlık
        Text(
          subtitle,
          style: TextStyle(
            color: colors.home.mainContainerTextColor,
            fontSize: AppFontSizes.s14,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
         SizedBox(height: 5.h),

        // Günlük hedef durumu
        Text(
          "Daily goal status: $dailyGoalStatus",
          style: TextStyle(
            color: colors.home.mainContainerTextColor,
            fontSize: AppFontSizes.s14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
