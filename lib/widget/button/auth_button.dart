import 'package:flutter/cupertino.dart';

import '../../themes/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.colors,
    // ? koyarak null olabilir dedik ve zorunlu kısmını kaldırdık
    this.onTap,
  });

  // dışarıdan parametre olarak almak istediğim değişkenler
  final AppColors colors;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    // gesture dedetector(Inkwell ya da elevated button da kullnılabilirdi) ile tıklanabilir olmasını sağlıyor widgetın
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          color: colors.login.buttonBgColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: colors.login.buttonStrokeColor),
        ),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
              color: colors.login.buttonTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}