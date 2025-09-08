import 'package:cerebria/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedItem extends StatelessWidget {
  final Color color;
  final String title;
  final String value;
  final Color textColor;

  const CompletedItem({
    Key? key,
    required this.color,
    required this.title,
    required this.value,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 87.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: AppFontSizes.s14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: AppFontSizes.s12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}