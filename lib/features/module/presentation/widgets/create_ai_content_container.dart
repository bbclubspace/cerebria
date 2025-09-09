import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAiContentContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color textColor;
  final String text;

  const CreateAiContentContainer({
    Key? key,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.textColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 127.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [color1, color2, color3],
          stops: [0.0, 0.40, 0.9],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: AppFontSizes.s14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
