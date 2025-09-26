import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/widgets/page_top_item.dart';
import '../../../../../data/model/quiz_item.dart';
import '../../../../widgets/vocabulary/exercise/button/exercise_button.dart';
import '../../../../widgets/vocabulary/exercise/card_top.dart';
import '../../../../../logic/quiz/quiz_cubit.dart';
import '../../../../../logic/quiz/quiz_state.dart';

class QuizExercise extends StatelessWidget {
  const QuizExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);

    return BlocProvider(
      create: (_) => QuizCubit(),
      child: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          final cubit = context.read<QuizCubit>();
          final currentQuestion = QuestionData.questions[state.currentIndex];

          return Scaffold(
            backgroundColor: appColors.vocabulary.pageBgColor,
            body: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  PageTopItem(
                    colors: appColors,
                    pageName: "Vocabulary Exercise",
                  ),
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
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 70.h),
                  ...currentQuestion.options.map((option) {
                    final isSelected = state.selectedAnswer == option;

                    Color bgColor =
                        appColors.vocabulary.exerciseItemContainerBgColor;
                    Color borderColor = Colors.transparent;

                    if (state.showCorrectAnswer) {
                      if (option == currentQuestion.correctAnswer) {
                        borderColor = appColors.vocabulary.exerciseItemCorrectBorderColor;
                        bgColor = appColors.vocabulary.exerciseItemCorrectBorderColor;
                      } 
                      else if (option == state.selectedAnswer) {
                        borderColor = appColors.vocabulary.exerciseItemWrongBorderColor;
                        bgColor = appColors.vocabulary.exerciseItemWrongBgColor;
                      }
                    } else if (isSelected) {
                      bgColor = appColors.vocabulary.exerciseItemSelectedColor;
                    }

                    return GestureDetector(
                      onTap: () {
                        if (!state.showCorrectAnswer) {
                          cubit.selectAnswer(option);
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
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 50.h),
                  Center(
                    child: ExerciseButton(
                      onPressed: () {
                        if (!state.showCorrectAnswer) {
                          bool success = cubit.checkAnswer();
                          
                          if (!success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please select an answer"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }

                        } else {
                          cubit.nextQuestion();
                        }
                      },
                      text: state.showCorrectAnswer ? "Next Question" : "Continue",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}