import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSelector extends StatelessWidget {
  final String value;
  final Color containerColor;
  final Color textColor;
  final Color strokeColor;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeSelector({
    required this.value,
    required this.containerColor,
    required this.textColor,
    required this.strokeColor,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(15),
          border: isSelected
              ? Border.all(color: strokeColor, width: 2)
              : Border.all(color: Colors.transparent, width: 0),
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 16.h,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}