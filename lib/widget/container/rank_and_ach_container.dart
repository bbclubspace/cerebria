import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/app_colors.dart';

class RankAndAchContainer extends StatelessWidget {
  const RankAndAchContainer({
    super.key,
    required this.bgColor,
    required this.colors,
    required this.title,
    required this.iconPath,
    required this.value,
  });

  // dışarıdan parametre olarak almak istediğim değişkenler
  final Color bgColor;
  final AppColors colors;
  final String title;
  final String iconPath;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: colors.home.rankTextColor,
              fontSize: 16.h,
              fontWeight: FontWeight.bold,
            ),
          ),
           SizedBox(height: 5.h),
          Image.asset(iconPath),
          Text(
            value,
            style: TextStyle(
              color: colors.home.rankTextColor,
              fontSize: 24.h,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
