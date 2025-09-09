import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/widgets/page_top_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/completed_item.dart';
import '../../widgets/create_ai_content_container.dart';
import '../../widgets/last_excercise_item.dart';
import '../../widgets/title_text.dart';

class ListeningPage extends StatelessWidget {
  const ListeningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: colors.listening.pageBgColor,
      body: Column(
        children: [
          SizedBox(height: 60.h),
          PageTopItem(colors: colors, pageName: "Listening"),
          SizedBox(height: 20.h),
          CreateAiContentContainer(
            // text içeriğini parametre olarak vermeyi deneyebilirsin diğer sayfalarda uğraşmamak için
            color1: colors.listening.createContainerBgColor1,
            color2: colors.listening.createContainerBgColor2,
            color3: colors.listening.createContainerBgColor3,
            textColor: colors.listening.createContainerTextColor,
            text: "START PRACTICING\n LISTENING WITH AI",
          ),
          SizedBox(height: 25.h),

          //completed exercise
          TitleText(colors: colors, title: "Completed Exercise"),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CompletedItem(
                color: colors.listening.completedContainerBgColor1,
                title: "Weekly",
                value: "20",
                textColor: colors.listening.itemTextColor,
              ),
              SizedBox(width: 10.w),
              CompletedItem(
                color: colors.listening.completedContainerBgColor2,
                title: "Montly",
                value: "50",
                textColor: colors.listening.itemTextColor,
              ),
              SizedBox(width: 10.w),
              CompletedItem(
                color: colors.listening.completedContainerBgColor3,
                title: "All Times",
                value: "200",
                textColor: colors.listening.itemTextColor,
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
            containerBgColor: colors.listening.lastExerciseContainerColor,
            textColor1: colors.listening.itemTextColor,
            textColor2: colors.listening.itemLevelTextColor,
            textColor3: colors.listening.itemDurationTextColor,
          ),
          SizedBox(height: 10.h),
          LastExerciseItem(
            containerBgColor: colors.listening.lastExerciseContainerColor,
            textColor1: colors.listening.itemTextColor,
            textColor2: colors.listening.itemLevelTextColor,
            textColor3: colors.listening.itemDurationTextColor,
          ),
        ],
      ),
    );
  }
}
