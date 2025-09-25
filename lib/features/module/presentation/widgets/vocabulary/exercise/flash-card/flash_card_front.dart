import 'package:flutter/material.dart';
import 'package:cerebria/core/utils/font_size.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../data/model/word_item.dart';
import 'flash_card_content.dart';


class FlashCardFront extends StatelessWidget {
  final WordItem wordItem;
  final AppColors appColors;
  const FlashCardFront({Key? key, required this.wordItem, required this.appColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlashCardContent(
      appColors: appColors,
      child: Text(
        wordItem.word,
        style: TextStyle(
          fontSize: AppFontSizes.s40,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
