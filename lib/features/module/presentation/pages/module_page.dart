import 'package:cerebria/core/constants/module_item.dart';
import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/page_top_item.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);

    return Scaffold(
      backgroundColor: colors.module.pageBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 70.h),
          // back button and page name
          PageTopItem(colors: colors, pageName: "Module",),
          SizedBox(height: 16.h),
          // module grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 160.w / 120.h,
              ),
              itemCount: modules.length,
              itemBuilder: (context, index) {
                final item = modules[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, item.route);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: item.color,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          Hero(
                            tag: "${item.iconPath}",
                            child: Image.asset(
                              item.iconPath,
                              width: 35.w,
                              height: 35.h,
                              fit: BoxFit.contain,
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            item.name,
                            style: TextStyle(
                              color: colors.module.moduleContainerTextColor,
                              fontSize: AppFontSizes.s12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
