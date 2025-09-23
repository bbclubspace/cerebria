import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/font_size.dart';

class DeleteAccountCard extends StatelessWidget {
  final AppColors appColors;

  const DeleteAccountCard({Key? key, required this.appColors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 351.w,
      height: 117.h,
      decoration: _boxDecoration(),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delete Account",
              style: TextStyle(
                color: appColors.profile.pagePrimaryTextColor,
                fontSize: AppFontSizes.s16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Are you sure you want to delete your account?",
              style: TextStyle(
                color: appColors.profile.pageSubtextColor,
                fontSize: AppFontSizes.s14,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                _deleteButton(
                  icon: "assets/profile-page-icon/sad.png",
                  text: "Delete",
                ),
                SizedBox(width: 15.w),
                _deleteButton(
                  icon: "assets/profile-page-icon/smile.png",
                  text: "Give up",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _deleteButton({required String icon, required String text}) {
    return Container(
      width: 143.w,
      height: 44.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: appColors.profile.deleteButtonStrokeColor,
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Image.asset(icon),
          SizedBox(width: 10.w),
          Text(
            text,
            style: TextStyle(
              color: appColors.profile.deleteButtonStrokeColor,
              fontSize: AppFontSizes.s18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
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
