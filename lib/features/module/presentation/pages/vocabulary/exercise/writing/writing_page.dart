import 'package:cerebria/core/utils/font_size.dart';
import 'package:cerebria/features/module/presentation/widgets/vocabulary/exercise/button/exercise_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/widgets/page_top_item.dart';
import '../../../../../logic/writing/writing_cubit.dart';
import '../../../../../logic/writing/writing_state.dart';
import '../../../../widgets/vocabulary/exercise/card_top.dart';
import '../../../../widgets/vocabulary/exercise/textfield/writing_textfield.dart';
import '../../../../widgets/vocabulary/exercise/writing/word_card.dart';

class WritingPage extends StatefulWidget {
  const WritingPage({Key? key}) : super(key: key);

  @override
  State<WritingPage> createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  late TextEditingController answerController;
       @override
  void initState() {
    super.initState();
    answerController = TextEditingController();
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    return BlocProvider(
      create: (_) => WritingCubit(),
      child: BlocConsumer<WritingCubit, WritingState>(
        listener: (context, state) {
          if (state.isCorrect) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Correct Answer")),
            );
            if (state.isCompleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("You have completed all words. Starting over."),
                ),
              );
            }
          } else if (state.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Please enter an answer."),
              ),
            );
          } else if (!state.isCorrect) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Wrong Answer",
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<WritingCubit>();
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
                WordCard(appColors: appColors, word: state.currentWord),
                SizedBox(height: 50.h),
                WritingTextfield(
                  appColors: appColors,
                  answerController: answerController,
                ),
                SizedBox(height: 100.h),
                Center(
                  child: ExerciseButton(
                    onPressed: () {
                      cubit.checkAnswer(answerController.text);
                    },
                    text: "Check",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
