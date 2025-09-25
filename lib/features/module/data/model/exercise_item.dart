import 'package:flutter/material.dart';

class ExerciseItem {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String navigate;

  ExerciseItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.navigate,
  });
}
