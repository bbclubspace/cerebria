import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../widgets/delete_account_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);

    return Scaffold(
      backgroundColor: appColors.profile.pageBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileHeader(appColors: appColors),
          SizedBox(height: 20.h),
          ProfileInfoCard(appColors: appColors),
          SizedBox(height: 20.h),
          DeleteAccountCard(appColors: appColors),
        ],
      ),
    );
  }
}
