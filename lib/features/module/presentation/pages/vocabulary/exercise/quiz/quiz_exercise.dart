import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/widgets/page_top_item.dart';
import '../../../../../data/model/quiz_item.dart';
import '../../../../widgets/vocabulary/exercise/button/exercise_button.dart';
import '../../../../widgets/vocabulary/exercise/card_top.dart';

class QuizExercise extends StatefulWidget {
  const QuizExercise({Key? key}) : super(key: key);

  @override
  _QuizExerciseState createState() => _QuizExerciseState();
}

class _QuizExerciseState extends State<QuizExercise> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool showCorrectAnswer = false;

  void _nextQuestion() {
    if (selectedAnswer == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Lütfen bir seçenek seçin")));
      return;
    }

    setState(() {
      showCorrectAnswer = true;
    });
  }

  void _goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < QuestionData.questions.length - 1) {
        currentQuestionIndex++;
      } else {
        currentQuestionIndex = 0;
      }
      selectedAnswer = null;
      showCorrectAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    final currentQuestion = QuestionData.questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: appColors.vocabulary.pageBgColor,
      body: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 70.h),
            Center(
              child: Text(
                currentQuestion.question,
                style: TextStyle(
                  fontSize: AppFontSizes.s24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 70.h),
            ...currentQuestion.options.map((option) {
              bool isSelected = selectedAnswer == option;
              bool isCorrect = option == currentQuestion.correctAnswer;

              Color bgColor =
                  appColors.vocabulary.exerciseItemContainerBgColor;
              Color borderColor = Colors.transparent;

              if (showCorrectAnswer) {
                if (isCorrect) {
                  borderColor =
                      appColors.vocabulary.exerciseItemCorrectBorderColor;
                  bgColor =
                      appColors.vocabulary.exerciseItemCorrectBorderColor;
                }
                if (isSelected && !isCorrect) {
                  borderColor =
                      appColors.vocabulary.exerciseItemWrongBorderColor;
                  bgColor = appColors.vocabulary.exerciseItemWrongBgColor;
                }
              } else if (isSelected) {
                bgColor = appColors.vocabulary.exerciseItemSelectedColor;
              }

              return GestureDetector(
                onTap: () {
                  if (!showCorrectAnswer) {
                    setState(() {
                      selectedAnswer = option;
                    });
                  }
                },
                child: Center(
                  child: Container(
                    width: 289.w,
                    height: 60.h,
                    margin: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 20.w,
                    ),
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: borderColor, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: appColors
                              .vocabulary
                              .exerciseItemContainerShadowColor,
                          blurRadius: 4.r,
                          spreadRadius: 0.5.r,
                          offset: Offset(3.w, 3.h),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        option,
                        style: TextStyle(
                          fontSize: AppFontSizes.s16,
                          fontWeight: FontWeight.w400,
                          color: isSelected ? Colors.black : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
            SizedBox(height: 50.h),
            Center(
              child: ExerciseButton(
                onPressed: showCorrectAnswer
                    ? _goToNextQuestion
                    : _nextQuestion,
                text: showCorrectAnswer ? "Next question" : "Continue",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
