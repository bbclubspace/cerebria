import 'package:cerebria/features/module/presentation/widgets/vocabulary/exercise/button/exercise_button.dart';
import 'package:cerebria/features/module/presentation/widgets/vocabulary/exercise/textfield/writing_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/utils/font_size.dart';
import '../../../../../../../core/widgets/page_top_item.dart';
import '../../../../widgets/vocabulary/exercise/card_top.dart';

class ExerciseListeningPage extends StatelessWidget {
  const ExerciseListeningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    TextEditingController answerController = TextEditingController();
    return Scaffold(
      backgroundColor: appColors.vocabulary.pageBgColor,
      body: Column(
        children: [
          SizedBox(height: 50.h),
          PageTopItem(colors: appColors, pageName: "Vocabulary Exercise"),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardTop(title: "Common Verbs", appColors: appColors),
              SizedBox(width: 10.w),
              CardTop(title: "B1", appColors: appColors),
            ],
          ),

          SizedBox(height: 20.h),
          Center(
            child: Text(
              "Listen, repeat and write",
              style: TextStyle(
                fontSize: AppFontSizes.s18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: appColors.vocabulary.exerciseItemContainerBgColor,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: appColors.vocabulary.exerciseItemContainerShadowColor,
                  blurRadius: 4.r,
                  spreadRadius: 0.5.r,
                  offset: Offset(3.w, 3.h),
                ),
              ],
            ),
            child: Image.asset("assets/module-icon/listen-image.png"),
          ),
          SizedBox(height:40.h),
          WritingTextfield(appColors: appColors, answerController: answerController),
          SizedBox(height:200.h),
          Center(
            child: ExerciseButton(onPressed: (){}, text: "Continue"),
          )
        ],
      ),
    );
  }
}