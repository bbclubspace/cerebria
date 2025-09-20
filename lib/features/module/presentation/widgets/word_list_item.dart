import 'package:cerebria/core/constants/module_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cerebria/core/themes/app_colors.dart';

class WordListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String category;
  final int wordCount;
  final String level;
  final int progressPercentage;
  final Color progressColor;
  final VoidCallback? onTap; // Tıklama callback'i eklendi

  const WordListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.wordCount,
    required this.level,
    required this.progressPercentage,
    required this.progressColor,
    this.onTap, // Optional callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Material(
        color: colors.vocabularyList.cardBgColor,
        borderRadius: BorderRadius.circular(16.r),
        elevation: 2,
        shadowColor: colors.vocabularyList.cardBoxShadowColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: onTap, // Tıklama işlevi eklendi
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Category Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: colors.vocabularyList.titleTextColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: progressColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: progressColor,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                // Subtitle
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: colors.vocabularyList.subtitleTextColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 16.h),

                // Stats Row
                Row(
                  children: [
                    // Word Count
                    _buildStatItem(
                      icon: Icons.book_outlined,
                      value: '$wordCount words',
                      color: colors.vocabularyList.cardWordCountTextColor,
                    ),

                    SizedBox(width: 20.w),

                    // Level
                    _buildStatItem(
                      icon: Icons.signal_cellular_alt,
                      value: level,
                      color: _getLevelColor(level),
                    ),

                    const Spacer(),

                    // Progress Percentage
                    Text(
                      '$progressPercentage%',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: progressColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                // Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: LinearProgressIndicator(
                    value: progressPercentage / 100.0,
                    backgroundColor: colors.vocabularyList.progressBarBgColor,
                    valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                    minHeight: 6.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16.w, color: color),
        SizedBox(width: 4.w),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            color: colors.vocabularyList.subtitleTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Color _getLevelColor(String level) {
    switch (level.toLowerCase()) {
      case 'beginner':
        return colors.vocabularyList.beginnerLevelColor;
      case 'intermediate':
        return colors.vocabularyList.intermediateLevelColor;
      case 'advanced':
        return colors.vocabularyList.advancedLevelColor;
      default:
        return colors.vocabularyList.defaultLevelColor;
    }
  }
}
