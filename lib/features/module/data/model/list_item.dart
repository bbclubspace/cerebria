import 'package:flutter/material.dart';

class ListItem {
  final String title;
  final String subtitle;
  final String category;
  final int wordCount;
  final String level;
  final int progressPercentage;
  final Color progressColor;

  ListItem({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.wordCount,
    required this.level,
    required this.progressPercentage,
    required this.progressColor,
  });
}
