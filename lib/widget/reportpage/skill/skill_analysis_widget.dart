import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../themes/app_colors.dart';
import '../../../model/module_item.dart';

class SkillAnalysisWidget extends StatelessWidget {
  final ModuleItem item;
  final AppColors colors;

  const SkillAnalysisWidget({super.key, required this.item, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(item.iconPath, width: 35.w, height: 35.h, fit: BoxFit.contain),
                  SizedBox(height: 4.h),
                  Text(
                    item.name,
                    style: TextStyle(
                      color: colors.module.moduleContainerTextColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 55.w,
                      height: 55.h,
                      child: CircularProgressIndicator(
                        value: 70 / 100,
                        strokeWidth: 8,
                        backgroundColor: colors.report.circleProgressBgColor,
                        color: colors.report.circleProgressColor,
                      ),
                    ),
                    Text("70%", style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
