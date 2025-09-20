import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/widgets/page_top_item.dart';

class WordListDetailPage extends StatefulWidget {
  final Map<String, dynamic> listData;

  const WordListDetailPage({Key? key, required this.listData})
    : super(key: key);

  @override
  State<WordListDetailPage> createState() => _WordListDetailPageState();
}

class _WordListDetailPageState extends State<WordListDetailPage> {
  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);

    return Scaffold(
      backgroundColor: appColors.module.pageBgColor,
      body: Column(
        children: [
          SizedBox(height: 50.h),
          // Back button and page name
          PageTopItem(colors: appColors, pageName: widget.listData['title']),
          SizedBox(height: 16.h),

          // Header Card
          _buildHeaderCard(),

          SizedBox(height: 20.h),

          // Exercise Types Section
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Egzersiz Türleri',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Exercise Cards
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildExerciseCard(
                            icon: Icons.credit_card,
                            iconColor: Colors.blue,
                            title: 'Kelime Kartları',
                            subtitle: 'Klasik çift taraflı kelime kartları',
                            onTap: () {
                              // Navigate to flashcards
                              print('Kelime Kartları tapped');
                            },
                          ),

                          _buildExerciseCard(
                            icon: Icons.quiz,
                            iconColor: Colors.green,
                            title: 'Yazım Testi',
                            subtitle: 'Kelimelerin doğru yazımını test et',
                            onTap: () {
                              // Navigate to spelling test
                              print('Yazım Testi tapped');
                            },
                          ),

                          _buildExerciseCard(
                            icon: Icons.shuffle,
                            iconColor: Colors.purple,
                            title: 'Eşleştirme',
                            subtitle: 'Kelime ve anlamlarını eşleştir',
                            onTap: () {
                              // Navigate to matching game
                              print('Eşleştirme tapped');
                            },
                          ),

                          _buildExerciseCard(
                            icon: Icons.headphones,
                            iconColor: Colors.orange,
                            title: 'Dinleme',
                            subtitle: 'Telaffuzu dinleyip kelimeyi bul',
                            onTap: () {
                              // Navigate to listening exercise
                              print('Dinleme tapped');
                            },
                          ),
                        ],
                      ),
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

  Widget _buildHeaderCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            widget.listData['progressColor'] ?? Colors.blue,
            (widget.listData['progressColor'] ?? Colors.blue).withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          // Background decoration
          Positioned(
            right: -20,
            top: -20,
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            right: 20,
            top: 10,
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
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
                  widget.listData['title'],
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),

                Text(
                  widget.listData['subtitle'],
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),

                SizedBox(height: 20.h),

                // Stats Row
                Row(
                  children: [
                    _buildStatItem(
                      icon: Icons.book,
                      label: 'Kelime',
                      value: '${widget.listData['wordCount']}',
                    ),
                    SizedBox(width: 30.w),
                    _buildStatItem(
                      icon: Icons.trending_up,
                      label: 'İlerleme',
                      value: '${widget.listData['progressPercentage']}%',
                    ),
                    SizedBox(width: 30.w),
                    _buildStatItem(
                      icon: Icons.star,
                      label: 'Seviye',
                      value: widget.listData['level'],
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Progress Bar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'İlerleme Durumu',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        Text(
                          '${widget.listData['progressPercentage']}%',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: LinearProgressIndicator(
                        value: widget.listData['progressPercentage'] / 100.0,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                        minHeight: 8.h,
                      ),
                    ),
                  ],
                ),
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
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24.w),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                // Icon Container
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(icon, color: iconColor, size: 24.w),
                ),

                SizedBox(width: 16.w),

                // Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                // Arrow Icon
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                  size: 16.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
