import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/themes/app_colors.dart';

class TitleText extends StatelessWidget {
  final AppColors colors;
  final String title;

  const TitleText({Key? key, required this.colors, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: colors.reading.contentTitleTextColor,
            fontWeight: FontWeight.w500,
            fontSize: AppFontSizes.s16,
          ),
        ),
      ),
    );
  }
}