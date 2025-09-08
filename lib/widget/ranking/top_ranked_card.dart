import 'package:cerebria/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/user_rank_detail.dart';
import '../../themes/app_colors.dart';

class TopRankCard extends StatelessWidget {
  final UserRankDetail user;
  final String medalAsset;
  final String avatarAsset;
  final double avatarSize;
  final double containerWidth;
  final double containerHeight;

  const TopRankCard({
    required this.user,
    required this.medalAsset,
    required this.avatarAsset,
    required this.avatarSize,
    required this.containerWidth,
    required this.containerHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false).ranking;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(avatarSize / 2),
          child: Image.asset(avatarAsset, fit: BoxFit.cover),
        ),

        SizedBox(height: 8.h),
        Text(user.name, style: TextStyle(color: colors.topRankNameTextColor,fontSize: AppFontSizes.s16)),
        Text(
          user.point.toString(),
          style: TextStyle(
            color: colors.topRankTextColor,
            fontWeight: FontWeight.bold,
            fontSize: AppFontSizes.s16,
          ),
        ),
        Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: colors.topRankContainerColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Image.asset(medalAsset)),
        ),
      ],
    );
  }
}