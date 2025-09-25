import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../widgets/delete_account_card.dart';
import '../widgets/earned_badges.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    final months = ["September", "October", "November"];
    final badges = [
      "assets/ranking-page-icon/first.png",
      "assets/ranking-page-icon/second.png",
      "assets/ranking-page-icon/third.png"
    ];
    return Scaffold(
      backgroundColor: appColors.profile.pageBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileHeader(appColors: appColors),
          SizedBox(height: 20.h),
          EarnedBadges(appColors: appColors, months: months, badges: badges),
          SizedBox(height: 20.h),
          ProfileInfoCard(appColors: appColors),
          SizedBox(height: 20.h),
          DeleteAccountCard(appColors: appColors),
        ],
      ),
    );
  }
}

