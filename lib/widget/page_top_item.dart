import 'package:flutter/cupertino.dart';

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
        const SizedBox(width: 16),
        AppBackButton(iconPath: "assets/auth-icon/back.png", colors: colors),
        const SizedBox(width: 100),
        Text(
          pageName,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: colors.module.titleTextColor,
          ),
        ),
      ],
    );
  }
}
