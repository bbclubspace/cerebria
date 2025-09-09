import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/model/user_rank_detail.dart';
import '../../../../../core/themes/app_colors.dart';

class OtherRankItem extends StatelessWidget {
  final UserRankDetail user;
  final int rankIndex;

  const OtherRankItem({required this.user, required this.rankIndex, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false).ranking;

    List<Color> rankContainerColors = [
      Colors.green,
      Colors.purple,
      Colors.orange,
      Colors.lightBlue,
      Colors.redAccent,
      Colors.purpleAccent,
      Colors.lightBlueAccent,
      Colors.yellowAccent,
      Colors.blueGrey,
      Colors.orangeAccent,
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colors.rankContainerBgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Rank number
          Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  rankContainerColors[(rankIndex - 4) %
                      rankContainerColors.length],
            ),
            alignment: Alignment.center,
            child: Text(
              "$rankIndex",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            alignment: Alignment.center,
            child: const Icon(Icons.person, color: Colors.white),
          ),

          SizedBox(width: 12.w),

          // User info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSizes.s14,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text(
                      "Level ${user.level}",
                      style: TextStyle(
                        color: colors.rankLevelTextColor,
                        fontSize: AppFontSizes.s12,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colors.rankStatusBgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        user.statusLevel,
                        style: TextStyle(
                          color: colors.rankStatusTextColor,
                          fontSize: AppFontSizes.s12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                user.point.toString(),
                style: TextStyle(
                  color: colors.rankPointTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    user.changePoint >= 0
                        ? Icons.trending_up
                        : Icons.trending_down,
                    color: user.changePoint >= 0
                        ? colors.rankPointPositiveChange
                        : colors.rankPointNegativeChange,
                  ),
                  Text(
                    "${user.changePoint}",
                    style: TextStyle(
                      color: user.changePoint >= 0
                          ? colors.rankPointPositiveChange
                          : colors.rankPointNegativeChange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}