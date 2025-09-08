import 'package:cerebria/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../themes/app_colors.dart';

class AlternatifLoginButton extends StatelessWidget {
  const AlternatifLoginButton({
    // flutter null safety bu yüzden required ekliyorz
    // bunlar zorunlu olarak kullanılmak zorunda oluyor
    // istemezsek ? koyup nullable yapabiliriz
    super.key,
    required this.colors,
    required this.iconPath,
    required this.buttonText,
    required this.bgColor,
    required this.textColor
  });

  // dışarıdan parametre olarak almak istediğim değişkenler
  final AppColors colors;
  final String iconPath;
  final String buttonText;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 50.h,
      decoration: BoxDecoration(
        // dışarıdan gelen parametreyi buraya atıyorum
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: colors.auth.googleSignInStrokeColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath,width: 50.w,height: 50.h,),
          Text(buttonText,style: TextStyle(color: textColor,fontSize: AppFontSizes.s14,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}