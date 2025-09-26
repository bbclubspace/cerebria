import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/model/word_item.dart';
import '../../../../../logic/flashcard/flash_card_cubit.dart';
import '../../../../../logic/flashcard/flash_card_state.dart';
import '../../../../widgets/vocabulary/exercise/button/exercise_button.dart';
import '../../../../widgets/vocabulary/exercise/flash-card/flash_card_front.dart';
import '../../../../widgets/vocabulary/exercise/flash-card/flash_card_back.dart';
import '../../../../widgets/vocabulary/exercise/card_top.dart';
import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/widgets/page_top_item.dart';

class FlashTest extends StatefulWidget {
  const FlashTest({Key? key}) : super(key: key);

  @override
  State<FlashTest> createState() => _FlashTestState();
}

class _FlashTestState extends State<FlashTest> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _toggleCard(FlashCubit cubit, bool isFront) {
    if (isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    cubit.toggleCard();
  }

  void _nextCard(FlashCubit cubit) {
    cubit.nextCard();
    _controller.reset();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);

    return BlocProvider(
      create: (_) => FlashCubit(),
      child: BlocBuilder<FlashCubit, FlashCardState>(
        builder: (context, state) {
          final cubit = context.read<FlashCubit>();
          final currentWord = wordData[state.currentIndex];

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
                  SizedBox(height: 50.h),
                  Padding(
                    padding: EdgeInsets.only(left: 35.w),
                    child: GestureDetector(
                      onTap: () => _toggleCard(cubit, state.isFront),
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          final angle = _controller.value * pi;
                          final isFrontVisible = angle <= pi / 2;
                          return Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(angle),
                            alignment: Alignment.center,
                            child: isFrontVisible
                                ? FlashCardFront(wordItem: currentWord, appColors: appColors)
                                : Transform(
                                    transform: Matrix4.identity()..rotateY(pi),
                                    alignment: Alignment.center,
                                    child: FlashCardBack(wordItem: currentWord, appColors: appColors),
                                  ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Center(
                    child: ExerciseButton(
                      onPressed: () => _nextCard(cubit),
                      text: "Continue",
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
