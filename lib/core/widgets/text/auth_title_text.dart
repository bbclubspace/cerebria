import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import '../../themes/app_colors.dart';

class AuthTitleText extends StatelessWidget {
  const AuthTitleText({
    super.key,
    required this.colors,
    required this.title,
  });

  // dışarıdan parametre olarak almak istediğim değişkenler
  final AppColors colors;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: colors.auth.titleTextColor,
        fontSize: AppFontSizes.s20,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}