import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/app_colors.dart';

class DailyContentStatus extends StatelessWidget {
  const DailyContentStatus({
    required this.iconPath,
    required this.title,
    required this.value,
    required this.colors,
    super.key,
  });

  // dışarıdan parametre olarak almak istediğim değişkenler
  final String iconPath;
  final String title;
  final String value;
  final AppColors colors;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(iconPath),
        Text(
          title,
          style: TextStyle(
            color: colors.home.mainContainerTextColor,
            fontSize: 12.h,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: colors.home.mainContainerTextColor,
            fontSize: 20.h,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}