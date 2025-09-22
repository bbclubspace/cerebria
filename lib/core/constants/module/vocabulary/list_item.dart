import '../../../../features/module/data/model/list_item.dart';
import '../../../themes/app_colors.dart';
import 'package:flutter/material.dart';

final colors = AppColors(isDarkMode: false);

final List<ListItem> vocabularyLists = [
  ListItem(
    title: 'Essential Verbs',
    subtitle: 'Verbs most commonly used in everyday life',
    category: 'Verbs',
    wordCount: 150,
    level: 'Beginner',
    progressPercentage: 65,
    progressColor: Colors.blue,
  ),
  ListItem(
    title: 'Common Nouns',
    subtitle: 'Basic nouns',
    category: 'Nouns',
    wordCount: 200,
    level: 'Beginner',
    progressPercentage: 30,
    progressColor: Colors.green,
  ),
  ListItem(
    title: 'Technology Terms',
    subtitle: 'Basic terms in the world of technology',
    category: 'Technology',
    wordCount: 120,
    level: 'Intermediate',
    progressPercentage: 0,
    progressColor: Colors.orange,
  ),
  ListItem(
    title: 'Business English',
    subtitle: 'Words used in business life',
    category: 'Business',
    wordCount: 180,
    level: 'Advanced',
    progressPercentage: 15,
    progressColor: Colors.deepOrange,
  ),
  ListItem(
    title: 'Travel Vocabulary',
    subtitle: 'Words needed for traveling',
    category: 'Travel',
    wordCount: 90,
    level: 'Beginner',
    progressPercentage: 80,
    progressColor: Colors.pink,
  ),
];
