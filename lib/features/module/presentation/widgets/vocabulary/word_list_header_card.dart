import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/model/list_item.dart';
import 'package:cerebria/core/themes/app_colors.dart';

class WordListHeaderCard extends StatelessWidget {
  final ListItem listData;

  const WordListHeaderCard({Key? key, required this.listData})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progressColor = listData.progressColor;
    final appColors = AppColors(isDarkMode: false);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [progressColor, progressColor.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          // Background decoration
          Positioned(
            right: -20.w,
            top: -20.h,
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: appColors.wordListDetail.boxDecorationColor.withOpacity(
                  0.2,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            right: 20.w,
            top: 10.h,
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: appColors.wordListDetail.boxDecorationColor.withOpacity(
                  0.3,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),

                // Title and subtitle
                Text(
                  listData.title,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: appColors.wordListDetail.textColor,
                  ),
                ),
                SizedBox(height: 8.h),

                Text(
                  listData.subtitle,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: appColors.wordListDetail.textColor.withOpacity(0.9),
                  ),
                ),

                SizedBox(height: 20.h),

                // Stats Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem(
                      icon: Icons.book,
                      label: 'Words',
                      value: '${listData.wordCount}',
                    ),
                    _buildStatItem(
                      icon: Icons.trending_up,
                      label: 'Progress',
                      value: '${listData.progressPercentage}%',
                    ),
                    _buildStatItem(
                      icon: Icons.star,
                      label: 'Level',
                      value: listData.level,
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Progress Bar
                _buildProgressBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    final appColors = AppColors(isDarkMode: false);

    return Column(
      children: [
        Icon(icon, color: appColors.wordListDetail.iconColor, size: 24.w),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: appColors.wordListDetail.textColor.withOpacity(0.9),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: appColors.wordListDetail.textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    final progressPercentage = listData.progressPercentage;
    final appColors = AppColors(isDarkMode: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Progress Status',
              style: TextStyle(
                fontSize: 15.sp,
                color: appColors.wordListDetail.textColor.withOpacity(0.9),
              ),
            ),
            Text(
              '$progressPercentage%',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: appColors.wordListDetail.textColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: LinearProgressIndicator(
            value: progressPercentage / 100.0,
            backgroundColor: appColors.wordListDetail.boxDecorationColor
                .withOpacity(0.3),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            minHeight: 8.h,
          ),
        ),
      ],
    );
  }
}
