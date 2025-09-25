import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/widgets/page_top_item.dart';
import 'package:cerebria/features/module/presentation/widgets/exercise_list_container.dart';
import '../../../../../core/routes/routes.dart';
import '../../widgets/vocabulary/word_list_header_card.dart';
import '../../../data/model/list_item.dart';
import '../../../../../core/constants/exercise_list_item.dart';

class WordListDetailPage extends StatefulWidget {
  final ListItem listData;

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
          PageTopItem(colors: appColors, pageName: widget.listData.title),
          SizedBox(height: 16.h),

          // Header Card - Artık ayrı bir widget
          WordListHeaderCard(listData: widget.listData),

          SizedBox(height: 20.h),

          // Exercise Types Section
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Exercise Types',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: appColors.wordListDetail.exerciseTypesTextColor,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Exercise Cards
                  Expanded(child: _buildExerciseList()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseList() {
    return ListView.builder(
      itemCount: exerciseItems.length,
      itemBuilder: (context, index) {
        final exercise = exerciseItems[index];
        return ExerciseCardContainer(
          exercise: exercise,
          onTap: () {
            print('${exercise.title} tapped');
            Navigator.pushNamed(context, exercise.navigate);
          },
        );
      },
    );
  }
}
