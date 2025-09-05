import 'package:cerebria/themes/app_colors.dart';
import 'package:cerebria/widget/page_top_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widget/module-item/completed_item.dart';
import '../../widget/module-item/create_ai_content_container.dart';
import '../../widget/module-item/last_excercise_item.dart';
import '../../widget/module-item/title_text.dart';

class GrammerPage extends StatelessWidget {
  const GrammerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: colors.grammer.pageBgColor,
      body: Column(
        children: [
          const SizedBox(height: 60),
          PageTopItem(colors: colors, pageName: "Grammer"),
          const SizedBox(height: 20),
          CreateAiContentContainer(
            // text içeriğini parametre olarak vermeyi deneyebilirsin diğer sayfalarda uğraşmamak için
            color1: colors.grammer.createContainerBgColor1,
            color2: colors.grammer.createContainerBgColor2,
            color3: colors.grammer.createContainerBgColor3,
            textColor: colors.grammer.createContainerTextColor,
            text: "GRAMMAR WITH AI\n RECOMMENDATIONS",
          ),
          const SizedBox(height: 25),

          //completed exercise
          TitleText(colors: colors, title: "Completed Exercise"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CompletedItem(
                color: colors.grammer.completedContainerBgColor1,
                title: "Weekly",
                value: "20",
                textColor: colors.grammer.itemTextColor,
              ),
              const SizedBox(width: 10),
              CompletedItem(
                color: colors.grammer.completedContainerBgColor2,
                title: "Montly",
                value: "50",
                textColor: colors.grammer.itemTextColor,
              ),
              const SizedBox(width: 10),
              CompletedItem(
                color: colors.grammer.completedContainerBgColor3,
                title: "All Times",
                value: "200",
                textColor: colors.grammer.itemTextColor,
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
            containerBgColor: colors.grammer.lastExerciseContainerColor,
            textColor1: colors.grammer.itemTextColor,
            textColor2: colors.grammer.itemLevelTextColor,
            textColor3: colors.grammer.itemDurationTextColor,
          ),
          const SizedBox(height: 10),
          LastExerciseItem(
            containerBgColor: colors.grammer.lastExerciseContainerColor,
            textColor1: colors.grammer.itemTextColor,
            textColor2: colors.grammer.itemLevelTextColor,
            textColor3: colors.grammer.itemDurationTextColor,
          ),
        ],
      ),
    );
  }
}
