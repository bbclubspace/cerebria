// Test için BackButton'u bu şekilde değiştirin:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

class BackButton extends StatelessWidget {
  const BackButton({
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
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: colors.login.textFieldBgColor,
          borderRadius: BorderRadius.circular(25), // 100 yerine 25
          border: Border.all(
            color: colors.login.textFieldStrokeColor,
            width: 1,
          ),
        ),
        child: Center( // Icon'u tam ortaya almak için
          child: Image.asset(
            iconPath,
            width: 24, // Daha küçük boyut
            height: 24,
            color: colors.login.textFieldStrokeColor,
            errorBuilder: (context, error, stackTrace) {
              // Eğer resim yüklenemezse alternatif icon göster
              return Icon(
                Icons.arrow_back,
                color: colors.login.textFieldStrokeColor,
                size: 24,
              );
            },
          ),
        ),
      ),
    );
  }
}