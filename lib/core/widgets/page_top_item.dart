import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';
import 'button/app_back_button.dart';

class PageTopItem extends StatelessWidget {
  const PageTopItem({super.key, required this.colors, required this.pageName});

  final AppColors colors;
  final String pageName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         SizedBox(width: 16.w),
        AppBackButton(iconPath: "assets/auth-icon/back.png", colors: colors),
         SizedBox(width: 100.w),
        Text(
          pageName,
          style: TextStyle(
            fontSize: AppFontSizes.s16,
            fontWeight: FontWeight.w400,
            color: colors.module.titleTextColor,
          ),
        ),
      ],
    );
  }
}
