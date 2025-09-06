import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        width: 300.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: colors.auth.buttonBgColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: colors.auth.buttonStrokeColor),
        ),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
              color: colors.auth.buttonTextColor,
              fontSize: 20.h,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}