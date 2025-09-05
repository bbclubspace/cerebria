import 'package:cerebria/themes/app_colors.dart';
import 'package:cerebria/widget/page_top_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widget/module-item/completed_item.dart';
import '../../widget/module-item/create_ai_content_container.dart';
import '../../widget/module-item/last_excercise_item.dart';
import '../../widget/module-item/title_text.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: colors.exam.pageBgColor,
      body: Column(
        children: [
          const SizedBox(height: 60),
          PageTopItem(colors: colors, pageName: "Exam"),
          const SizedBox(height: 20),
          CreateAiContentContainer(
            // text içeriğini parametre olarak vermeyi deneyebilirsin diğer sayfalarda uğraşmamak için
            color1: colors.exam.createContainerBgColor1,
            color2: colors.exam.createContainerBgColor2,
            color3: colors.exam.createContainerBgColor3,
            textColor: colors.exam.createContainerTextColor,
            text: "CREATE YOUR OWN LIST OR\n   USE A READY-MADE ONE",
          ),
          const SizedBox(height: 25),

          //completed exercise
          TitleText(colors: colors, title: "Completed Exercise"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CompletedItem(
                color: colors.exam.completedContainerBgColor1,
                title: "Weekly",
                value: "20",
                textColor: colors.exam.itemTextColor,
              ),
              const SizedBox(width: 10),
              CompletedItem(
                color: colors.exam.completedContainerBgColor2,
                title: "Montly",
                value: "50",
                textColor: colors.exam.itemTextColor,
              ),
              const SizedBox(width: 10),
              CompletedItem(
                color: colors.exam.completedContainerBgColor3,
                title: "All Times",
                value: "200",
                textColor: colors.exam.itemTextColor,
              ),
            ],
          ),
          const SizedBox(height: 25),
          // last excercise
          TitleText(colors: colors, title: "Last Exercise"),
          const SizedBox(height: 10),
          // ileride burası listview builder(veri tabanından gelen veri sayısı belli olmayacağı için) ile olacak
          // burada da text içeriklerini parametre olarak vermeyi ekleyip diğer sayfalarda kolaylık sağlayabilirsin
          // ekleyebilirsen ekle olmazsa ben eklerim
          LastExerciseItem(
            containerBgColor: colors.exam.lastExerciseContainerColor,
            textColor1: colors.exam.itemTextColor,
            textColor2: colors.exam.itemLevelTextColor,
            textColor3: colors.exam.itemDurationTextColor,
          ),
          const SizedBox(height: 10),
          LastExerciseItem(
            containerBgColor: colors.exam.lastExerciseContainerColor,
            textColor1: colors.exam.itemTextColor,
            textColor2: colors.exam.itemLevelTextColor,
            textColor3: colors.exam.itemDurationTextColor,
          ),
        ],
      ),
    );
  }
}
