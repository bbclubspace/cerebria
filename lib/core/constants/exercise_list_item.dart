import 'package:cerebria/core/routes/routes.dart';
import 'package:cerebria/features/module/data/model/exercise_item.dart';
import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

final colors = AppColors(isDarkMode: false);

final List<ExerciseItem> exerciseItems = [
  ExerciseItem(
    icon: Icons.credit_card,
    iconColor: colors.exerciseList.creditCardColor,
    title: 'Flashcards',
    subtitle: 'Classic double-sided flashcards',
    navigate: Routes.vocabulary_flash_exercise,
  ),
  ExerciseItem(
    icon: Icons.keyboard,
    iconColor: colors.exerciseList.writingColor,
    title: 'Spelling Test',
    subtitle: 'Test the correct spelling of words',
    navigate: Routes.vocabulary_writing_page,
  ),
  ExerciseItem(
    icon: Icons.quiz,
    iconColor: colors.exerciseList.quizColor,
    title: 'Multiple Choice Quiz',
    subtitle: 'Choose the correct answer from options',
    navigate: Routes.vocabulary_quiz_exercise,
  ),
  ExerciseItem(
    icon: Icons.headset,
    iconColor: colors.exerciseList.dinlemeColor,
    title: 'Listening',
    subtitle: 'Listen and identify the words',
    navigate: Routes.vocabulary_listening_page,
  ),
];
