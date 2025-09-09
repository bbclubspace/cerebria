import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/report_constants.dart';

class ContentSelectorBottomSheet {
  static Future<String?> show(BuildContext context, List<Color> colorItem) {
    final colors = AppColors(isDarkMode: false);
    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: colors.report.bottomSheetBgColor,
      isScrollControlled: false,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: colors.report.bottomSheetContainerColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 50.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: colors.report.bottomSheetContentContainerColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Select Activity",
                      style: TextStyle(
                        fontSize: AppFontSizes.s16,
                        fontWeight: FontWeight.bold,
                        color: colors.report.bottomSheetTitleTextColor,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: ReportConstants.activityOptions.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 80.h,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.h,
                      ),
                      itemBuilder: (context, index) {
                        final option = ReportConstants.activityOptions[index];
                        final optionColor = colorItem[index];

                        return GestureDetector(
                          onTap: () => Navigator.pop(context, option["title"]),
                          child: Container(
                            decoration: BoxDecoration(
                              color: optionColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(18.r),
                              border: Border.all(
                                color: optionColor,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(option["icon"], color: Colors.white, size: AppFontSizes.s20),
                                SizedBox(height: 8.h),
                                Text(
                                  option["title"],
                                  style: TextStyle(
                                    fontSize: AppFontSizes.s20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white, // Yazı opak
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
