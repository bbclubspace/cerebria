import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/widgets/page_top_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/completed_item.dart';
import '../../widgets/create_ai_content_container.dart';
import '../../widgets/last_excercise_item.dart';
import '../../widgets/title_text.dart';

class VocabularyPage extends StatelessWidget {
  const VocabularyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: colors.vocabulary.pageBgColor,
      body: Column(
        children: [
          SizedBox(height: 60.h),
          PageTopItem(colors: colors, pageName: "Vocabulary"),
          SizedBox(height: 20.h),
          CreateAiContentContainer(
            // <--- Burası
            color1: colors.vocabulary.createContainerBgColor1,
            color2: colors.vocabulary.createContainerBgColor2,
            color3: colors.vocabulary.createContainerBgColor3,
            textColor: colors.vocabulary.createContainerTextColor,
            text: "CREATE YOUR OWN LIST OR\n   USE A READY-MADE ONE",
            onTap: () {
              Navigator.pushNamed(context, '/vocabulary_list_page');
            },
          ),
          SizedBox(height: 25.h),

          //completed exercise
          TitleText(colors: colors, title: "Completed Exercise"),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CompletedItem(
                color: colors.vocabulary.completedContainerBgColor1,
                title: "Weekly",
                value: "20",
                textColor: colors.vocabulary.itemTextColor,
              ),
              SizedBox(width: 10.h),
              CompletedItem(
                color: colors.vocabulary.completedContainerBgColor2,
                title: "Montly",
                value: "50",
                textColor: colors.vocabulary.itemTextColor,
              ),
              SizedBox(width: 10.h),
              CompletedItem(
                color: colors.vocabulary.completedContainerBgColor3,
                title: "All Times",
                value: "200",
                textColor: colors.vocabulary.itemTextColor,
              ),
            ],
          ),
          SizedBox(height: 25.h),
          // last excercise
          TitleText(colors: colors, title: "Last Exercise"),
          SizedBox(height: 10.h),
          // ileride burası listview builder(veri tabanından gelen veri sayısı belli olmayacağı için) ile olacak
          // burada da text içeriklerini parametre olarak vermeyi ekleyip diğer sayfalarda kolaylık sağlayabilirsin
          // ekleyebilirsen ekle olmazsa ben eklerim
          LastExerciseItem(
            containerBgColor: colors.vocabulary.lastExerciseContainerColor,
            textColor1: colors.vocabulary.itemTextColor,
            textColor2: colors.vocabulary.itemLevelTextColor,
            textColor3: colors.vocabulary.itemDurationTextColor,
          ),
          SizedBox(height: 10.h),
          LastExerciseItem(
            containerBgColor: colors.vocabulary.lastExerciseContainerColor,
            textColor1: colors.vocabulary.itemTextColor,
            textColor2: colors.vocabulary.itemLevelTextColor,
            textColor3: colors.vocabulary.itemDurationTextColor,
          ),
        ],
      ),
    );
  }
}
