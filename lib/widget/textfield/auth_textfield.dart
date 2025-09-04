import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield({
    Key? key,
    required this.colors,
    required this.iconPath,
    required this.hintText,
  }) : super(key: key);

  // dışarıdan parametre olarak almak istediğim değişkenler
  // buraya controller ekleyip kullanıcı girdilerini tutabileceğimiz formata çevirmeni istiyorum
  final AppColors colors;
  final String iconPath;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      // burda genişlik ve yüksekliği sabit verdik ama diğer ekranlarda uyumlu olması için ilerde Size değişkeniyle ekrana göre vericez
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: colors.login.textFieldBgColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: colors.login.textFieldStrokeColor),
      ),
      child: TextField(
        decoration: InputDecoration(
          // assets icon image
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              iconPath,
              width: 50,
              height: 50,
              color: colors.login.textFieldStrokeColor,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: colors.login.textFieldStrokeColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
        style: TextStyle(color: colors.login.titleTextColor),
      ),
    );
  }
}
