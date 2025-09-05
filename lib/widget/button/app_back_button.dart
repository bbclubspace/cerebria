// Test için BackButton'u bu şekilde değiştirin:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
    required this.iconPath,
    required this.colors,
    this.onTap,
  }) : super(key: key);

  final String iconPath;
  final AppColors colors;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: colors.auth.backButtonBgColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: colors.auth.backButtonStrokeColor,
            width: 1,
          ),
        ),
        child: Center(
          // Icon'u tam ortaya almak için
          child: Image.asset(
            iconPath,
            width: 24, // Daha küçük boyut
            height: 24,
          ),
        ),
      ),
    );
  }
}
