import 'package:flutter/cupertino.dart';

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
            width: 40,
            height: 40,
            // arkasını circle yapabilmek için
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.home.menuButtonBgColor,
            ),
            child: Image.asset(
              "assets/homepage-icon/menu.png",
              width: 30,
              height: 30,
            ),
          ),
        ),
        const SizedBox(width: 100),
        // uygulama ismi
        Text(
          "Cerebria",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: colors.home.appNameTextColor,
          ),
        ),
        const SizedBox(width: 100),
        // seçilen dil butonu
        Container(
          width: 30,
          height: 30,
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
