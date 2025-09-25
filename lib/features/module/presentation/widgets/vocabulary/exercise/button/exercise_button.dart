import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cerebria/core/utils/font_size.dart';

class ExerciseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ExerciseButton({Key? key, required this.onPressed, required this.text})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 298.w,
        height: 61.h,
        decoration: BoxDecoration(
          color: const Color(0xFFC2F3B5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: AppFontSizes.s18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
