import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.colors});

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 8,
      decoration: BoxDecoration(
        color: colors.home.statusBarEndColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          value: 0.4,
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(
            colors.home.statusBarStartColor,
          ),
        ),
      ),
    );
  }
}