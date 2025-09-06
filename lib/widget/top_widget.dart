import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../themes/app_colors.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key, required this.colors, required this.onTapMenu});

  final AppColors colors;
  final Function() onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // menu buton
        GestureDetector(
          onTap: onTapMenu,
          child: Container(
            width: 40.w,
            height: 40.h,
            // arkasını circle yapabilmek için
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.home.menuButtonBgColor,
            ),
            child: Image.asset(
              "assets/homepage-icon/menu.png",
              width: 30.w,
              height: 30.h,
            ),
          ),
        ),
         Spacer(),
        // uygulama ismi
        Text(
          "Cerebria",
          style: TextStyle(
            fontSize: 24.h,
            fontWeight: FontWeight.bold,
            color: colors.home.appNameTextColor,
          ),
        ),
        Spacer(),
        // seçilen dil butonu
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage("assets/homepage-icon/language-icon.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
