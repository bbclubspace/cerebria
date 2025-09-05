import 'package:cerebria/themes/app_colors.dart';
import 'package:cerebria/widget/page_top_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widget/module-item/completed_item.dart';
import '../../widget/module-item/create_ai_content_container.dart';
import '../../widget/module-item/last_excercise_item.dart';
import '../../widget/module-item/title_text.dart';

class ListeningPage extends StatelessWidget {
  const ListeningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: colors.reading.pageBgColor,
      body: Column(
        children: [
          const SizedBox(height: 60),
          PageTopItem(colors: colors, pageName: "Reading"),
          const SizedBox(height: 20),
          CreateAiContentContainer(
            // text içeriğini parametre olarak vermeyi deneyebilirsin diğer sayfalarda uğraşmamak için
            color1: colors.reading.createContainerBgColor1,
            color2: colors.reading.createContainerBgColor2,
            color3: colors.reading.createContainerBgColor3,
            textColor: colors.reading.createContainerTextColor,
          ),
          const SizedBox(height: 25),

          //completed reading
          TitleText(colors: colors, title: "Completed Reading"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CompletedItem(
                color: colors.reading.completedContainerBgColor1,
                title: "Weekly",
                value: "20",
                textColor: colors.reading.itemTextColor,
              ),
              const SizedBox(width: 10),
              CompletedItem(
                color: colors.reading.completedContainerBgColor2,
                title: "Montly",
                value: "50",
                textColor: colors.reading.itemTextColor,
              ),
              const SizedBox(width: 10),
              CompletedItem(
                color: colors.reading.completedContainerBgColor3,
                title: "All Times",
                value: "200",
                textColor: colors.reading.itemTextColor,
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
            containerBgColor: colors.reading.lastExerciseContainerColor,
            textColor1: colors.reading.itemTextColor,
            textColor2: colors.reading.itemLevelTextColor,
            textColor3: colors.reading.itemDurationTextColor,
          ),
          const SizedBox(height: 10),
          LastExerciseItem(
            containerBgColor: colors.reading.lastExerciseContainerColor,
            textColor1: colors.reading.itemTextColor,
            textColor2: colors.reading.itemLevelTextColor,
            textColor3: colors.reading.itemDurationTextColor,
          ),
        ],
      ),
    );
  }
}
