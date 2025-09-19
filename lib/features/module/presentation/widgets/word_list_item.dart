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

  const WordListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.wordCount,
    required this.level,
    required this.progressPercentage,
    required this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);

    Color levelColor;
    if (level.toLowerCase() == 'beginner') {
      levelColor = appColors.vocabularyList.beginnerLevelColor;
    } else if (level.toLowerCase() == 'intermediate') {
      levelColor = appColors.vocabularyList.intermediateLevelColor;
    } else {
      levelColor = appColors.vocabularyList.advancedLevelColor;
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: appColors.vocabularyList.cardBgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: appColors.vocabularyList.cardBoxShadowColor,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        // Hizalamayı daha esnek hale getirmek için kaldırdık
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Sol Kısım: Dikey Seviye Şeridi
          Container(
            width: 30.w,
            padding: EdgeInsets.symmetric(vertical: 25.h),
            decoration: BoxDecoration(
              color: levelColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: RotatedBox(
              quarterTurns: 3,
              child: Center(
                // Metni dikey olarak ortalamak için Center ekledik
                child: Text(
                  level
                      .toUpperCase(), // Daha dikkat çekici olması için büyük harf yapabiliriz
                  style: TextStyle(
                    color: appColors.vocabularyList.levelTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.h,
                  ),
                ),
              ),
            ),
          ),

          // Kartın Geri Kalan İçeriği
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.w,
                                color: appColors.vocabularyList.titleTextColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '$category • $wordCount kelime',
                          style: TextStyle(
                            color: appColors.vocabularyList.categoryTextColor,
                            fontSize: 13.w,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: appColors.vocabularyList.subtitleTextColor,
                            fontSize: 14.w,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        LinearProgressIndicator(
                          value: progressPercentage / 100,
                          backgroundColor:
                              appColors.vocabularyList.progressBarBgColor,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            progressColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
