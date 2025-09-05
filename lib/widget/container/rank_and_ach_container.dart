import 'package:flutter/cupertino.dart';

import '../../themes/app_colors.dart';

class RankAndAchContainer extends StatelessWidget {
  const RankAndAchContainer({
    super.key,
    required this.bgColor,
    required this.colors,
    required this.title,
    required this.iconPath,
    required this.value,
  });

  // dışarıdan parametre olarak almak istediğim değişkenler
  final Color bgColor;
  final AppColors colors;
  final String title;
  final String iconPath;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 120,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: colors.home.rankTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Image.asset(iconPath),
          Text(
            value,
            style: TextStyle(
              color: colors.home.rankTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
