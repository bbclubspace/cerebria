import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/widgets/page_top_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/completed_item.dart';
import '../../widgets/create_ai_content_container.dart';
import '../../widgets/last_excercise_item.dart';
import '../../widgets/title_text.dart';

class SpeakingPage extends StatelessWidget {
  const SpeakingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: colors.speaking.pageBgColor,
      body: Column(
        children: [
           SizedBox(height: 60.h),
          PageTopItem(colors: colors, pageName: "Speaking",image: "assets/content-icon/talking.png",),
           SizedBox(height: 20.h),
          CreateAiContentContainer(
            // text içeriğini parametre olarak vermeyi deneyebilirsin diğer sayfalarda uğraşmamak için
            color1: colors.speaking.createContainerBgColor1,
            color2: colors.speaking.createContainerBgColor2,
            color3: colors.speaking.createContainerBgColor3,
            textColor: colors.speaking.createContainerTextColor,
            text: "START PRACTICING\nSPEAKING WITH AI",
          ),
           SizedBox(height: 25.h),

          //completed exercise
          TitleText(colors: colors, title: "Completed Exercise"),
           SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CompletedItem(
                color: colors.speaking.completedContainerBgColor1,
                title: "Weekly",
                value: "20",
                textColor: colors.speaking.itemTextColor,
              ),
               SizedBox(width: 10.w),
              CompletedItem(
                color: colors.speaking.completedContainerBgColor2,
                title: "Montly",
                value: "50",
                textColor: colors.speaking.itemTextColor,
              ),
               SizedBox(width: 10.w),
              CompletedItem(
                color: colors.speaking.completedContainerBgColor3,
                title: "All Times",
                value: "200",
                textColor: colors.speaking.itemTextColor,
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
            containerBgColor: colors.speaking.lastExerciseContainerColor,
            textColor1: colors.speaking.itemTextColor,
            textColor2: colors.speaking.itemLevelTextColor,
            textColor3: colors.speaking.itemDurationTextColor,
          ),
          const SizedBox(height: 10),
          LastExerciseItem(
            containerBgColor: colors.speaking.lastExerciseContainerColor,
            textColor1: colors.speaking.itemTextColor,
            textColor2: colors.speaking.itemLevelTextColor,
            textColor3: colors.speaking.itemDurationTextColor,
          ),
        ],
      ),
    );
  }
}
