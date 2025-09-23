import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';

class ProfileInfoCard extends StatelessWidget {
  final AppColors appColors;

  const ProfileInfoCard({Key? key, required this.appColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355.w,
      height: 200.h,
      decoration: _boxDecoration(),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          _infoRow("assets/auth-icon/person.png", "@lvnt.aslann"),
          SizedBox(height: 10.h),
          _infoRow("assets/auth-icon/mail.png", "lvnt.aslann@gmail.com"),
          SizedBox(height: 10.h),
          _infoRow("assets/auth-icon/password.png", "********"),
          SizedBox(height: 20.h),
          _updateButton(),
        ],
      ),
    );
  }

  Widget _infoRow(String icon, String text) {
    return Padding(
      padding: EdgeInsets.only(left: 70.w),
      child: Row(
        children: [
          Image.asset(icon),
          SizedBox(width: 30.w),
          Text(
            text,
            style: TextStyle(
              color: appColors.profile.pageSubtextColor,
              fontSize: AppFontSizes.s14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _updateButton() {
    return Container(
      width: 149.w,
      height: 41.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            appColors.profile.updateButtonFirstColor,
            appColors.profile.updateButtonSecondColor,
          ],
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Center(
        child: Text(
          "Update",
          style: TextStyle(
            color: appColors.profile.updateButtonTextColor,
            fontSize: AppFontSizes.s20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
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
    );
  }
}
