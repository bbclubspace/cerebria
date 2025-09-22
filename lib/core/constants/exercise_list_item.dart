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
  ),
  ExerciseItem(
    icon: Icons.keyboard,
    iconColor: colors.exerciseList.writingColor,
    title: 'Spelling Test',
    subtitle: 'Test the correct spelling of words',
  ),
  ExerciseItem(
    icon: Icons.quiz,
    iconColor: colors.exerciseList.quizColor,
    title: 'Multiple Choice',
    subtitle: 'Choose the correct answer from options',
  ),
  ExerciseItem(
    icon: Icons.shuffle,
    iconColor: colors.exerciseList.eslestirmeColor,
    title: 'Matching',
    subtitle: 'Match words with their meanings',
  ),
  ExerciseItem(
    icon: Icons.headset,
    iconColor: colors.exerciseList.dinlemeColor,
    title: 'Listening',
    subtitle: 'Listen and identify the words',
  ),
];
