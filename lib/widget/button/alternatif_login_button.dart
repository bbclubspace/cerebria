import 'package:flutter/cupertino.dart';

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
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        // dışarıdan gelen parametreyi buraya atıyorum
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: colors.login.googleSignInStrokeColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath,width: 30,height: 30,),
          SizedBox(width: 10,),
          Text(buttonText,style: TextStyle(color: textColor,fontSize: 17,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}