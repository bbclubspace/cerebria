import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';
import '../../../../core/widgets/page_top_item.dart';
import 'floating_circle.dart';
import 'tirangle_clipper.dart';

class ProfileHeader extends StatelessWidget {
  final AppColors appColors;

  const ProfileHeader({Key? key, required this.appColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: TriangleClipper(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 270.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  appColors.profile.headerContainerFirstColor,
                  appColors.profile.headerContainerSecondColor,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: FloatingCircle(
            size: 150.w,
            color: appColors.profile.circleContainerFirstColor,
            startX: 200.w,
            startY: 20.h,
            durationSeconds: 5,
            xBegin: -10,
            xEnd: 10,
            yBegin: -5,
            yEnd: 5,
          ),
        ),
        Positioned(
          top: 50.h,
          child: PageTopItem(colors: appColors, pageName: "Profile"),
        ),
        Positioned(
          top: 20.h,
          left: 250.w,
          child: FloatingCircle(
            size: 70.w,
            color: appColors.profile.circleContainerFirstColor,
            startX: 250.w,
            startY: 20.h,
            durationSeconds: 4,
            xBegin: -15,
            xEnd: 15,
            yBegin: -10,
            yEnd: 10,
          ),
        ),
        Positioned(
          top: 100.h,
          left: 300.w,
          child: FloatingCircle(
            size: 50.w,
            color: appColors.profile.circleContainerFirstColor,
            startX: 300.w,
            startY: 100.h,
            durationSeconds: 3,
            xBegin: -8,
            xEnd: 8,
            yBegin: -12,
            yEnd: 12,
          ),
        ),
        Positioned(
          top: 120.h,
          left: 150.w,
          child: _buildProfileIcon(),
        ),
        Positioned(
          top: 200.h,
          left: 80.w,
          child: _buildNameCard(),
        ),
      ],
    );
  }

  Widget _buildProfileIcon() {
    return Container(
      width: 75.w,
      height: 75.h,
      decoration: BoxDecoration(
        color: appColors.profile.profileContainerBgColor,
        border: Border.all(
          color: appColors.profile.profileContainerStrokeColor,
          width: 2.w,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset("assets/profile-page-icon/profile-icon.png"),
      ),
    );
  }

  Widget _buildNameCard() {
    return Container(
      width: 211.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: appColors.profile.containerBgColor,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Levent",
            style: TextStyle(
              color: appColors.profile.pagePrimaryTextColor,
              fontWeight: FontWeight.bold,
              fontSize: AppFontSizes.s16,
            ),
          ),
          Text(
            "lvnt.aslann@gmail.com",
            style: TextStyle(
              color: appColors.profile.pageSubtextColor,
              fontSize: AppFontSizes.s14,
            ),
          ),
        ],
      ),
    );
  }
}
