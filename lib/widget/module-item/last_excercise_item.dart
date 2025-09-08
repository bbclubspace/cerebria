import 'package:cerebria/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LastExerciseItem extends StatelessWidget {
  final Color containerBgColor;
  final Color textColor1;
  final Color textColor2;
  final Color textColor3;
  const LastExerciseItem({Key? key,required this.containerBgColor,required this.textColor1,required this.textColor2, required this.textColor3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 337.w,
      height: 76.h,
      decoration: BoxDecoration(
        color: containerBgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Environment",
              style: TextStyle(
                color: textColor1,
                fontSize: AppFontSizes.s14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Level:B1",
                  style: TextStyle(
                    color: textColor2,
                    fontSize: AppFontSizes.s12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "5 min",
                  style: TextStyle(
                    color: textColor3,
                    fontSize: AppFontSizes.s12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}