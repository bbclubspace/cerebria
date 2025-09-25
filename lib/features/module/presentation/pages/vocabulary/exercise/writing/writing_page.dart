import 'package:cerebria/core/utils/font_size.dart';
import 'package:cerebria/features/module/data/model/writing_item.dart';
import 'package:cerebria/features/module/presentation/widgets/vocabulary/exercise/button/exercise_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/widgets/page_top_item.dart';
import '../../../../widgets/vocabulary/exercise/card_top.dart';
import '../../../../widgets/vocabulary/exercise/textfield/writing_textfield.dart';
import '../../../../widgets/vocabulary/exercise/writing/word_card.dart';

class WritingPage extends StatefulWidget {
  const WritingPage({Key? key}) : super(key: key);

  @override
  _WritingPageState createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  int currentWordIndex = 0;
  final TextEditingController answerController = TextEditingController();

  void _checkAnswer() {
    final userAnswer = answerController.text.trim().toLowerCase();
    final correctAnswer =
        WritingData.writingData[currentWordIndex].correctAnswer.toLowerCase();

    if (userAnswer == correctAnswer) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Correct Answer")),
      );

      setState(() {
        answerController.clear();
        if (currentWordIndex < WritingData.writingData.length - 1) {
          currentWordIndex++;
        } else {
          currentWordIndex = 0;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("You have completed all words. Starting over."),
            ),
          );
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Wrong Answer \nCorrect Answer: ${WritingData.writingData[currentWordIndex].correctAnswer}",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    final currentWord = WritingData.writingData[currentWordIndex];

    return Scaffold(
      backgroundColor: appColors.vocabulary.pageBgColor,
      body: Column(
        children: [
          SizedBox(height: 50.h),
          PageTopItem(colors: appColors, pageName: "Vocabulary Exercise"),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardTop(title: "Common Verbs", appColors: appColors),
              SizedBox(width: 10.w),
              CardTop(title: "B1", appColors: appColors),
            ],
          ),
          SizedBox(height: 50.h),
          Text(
            "Write a sentence about the word",
            style: TextStyle(
              fontSize: AppFontSizes.s18,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "and check it",
            style: TextStyle(
              fontSize: AppFontSizes.s18,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 50.h),
          WordCard(appColors: appColors, word: currentWord),
          SizedBox(height: 50.h),
          WritingTextfield(appColors: appColors, answerController: answerController),
          SizedBox(height: 100.h),
          Center(
            child: ExerciseButton(
              onPressed: _checkAnswer,
              text: "Check",
            ),
          )
        ],
      ),
    );
  }
}



