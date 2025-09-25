import 'package:cerebria/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/model/word_item.dart';
import 'flash_card_content.dart';
import 'package:cerebria/core/utils/font_size.dart';

class FlashCardBack extends StatelessWidget {
  final WordItem wordItem;
  final AppColors appColors;
  const FlashCardBack({Key? key, required this.wordItem, required this.appColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlashCardContent(
      appColors: appColors,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wordItem.meaning,
                style: TextStyle(
                  fontSize: AppFontSizes.s22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),

              Text(
                '"${wordItem.example}"',
                style: TextStyle(
                  fontSize: AppFontSizes.s16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.h),

              if (wordItem.fixedStructures.isNotEmpty) ...[
                _sectionTitle("Kalıplaşmış Yapılar"),
                for (var fs in wordItem.fixedStructures)
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("• ",
                            style: TextStyle(
                                fontSize: AppFontSizes.s16,
                                fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Text(
                            fs,
                            style: TextStyle(fontSize: AppFontSizes.s16),
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 12.h),
              ],

              if (wordItem.idioms.isNotEmpty) ...[
                _sectionTitle("Deyimler"),
                for (var idiom in wordItem.idioms)
                  Padding(
                    padding: EdgeInsets.only(left: 8.w, bottom: 4.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("• ",
                            style: TextStyle(
                                fontSize: AppFontSizes.s16,
                                fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Text(
                            idiom,
                            style: TextStyle(fontSize: AppFontSizes.s16),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: AppFontSizes.s18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
