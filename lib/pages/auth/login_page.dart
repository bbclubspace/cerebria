import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../themes/app_colors.dart';
import '../../widget/button/alternatif_login_button.dart';
import '../../widget/button/auth_button.dart';
import '../../widget/text/auth_title_text.dart';
import '../../widget/textfield/auth_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppColors sınıfının nesnesini oluşturduk darkmode default false verdik ilerde bunu state manangement ile yöneticez
    final colors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: colors.login.pageBgColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // flutterda boşluk bırakmak için bu widget kullanılıyor
            const SizedBox(height: 150),
            // giriş ekranındaki title
            AuthTitleText(colors: colors, title: "Join"),
            AuthTitleText(colors: colors, title: "Community"),
            AuthTitleText(colors: colors, title: "Learning"),

            const SizedBox(height: 40),
            //component mantığı ile kullanıcı girişi ile textfield oluşturduk
            //controller değişkenleri eklenmedi şuan girdileri işleyemiyoruz
            // istersen sen eklemeyi deneyebilirsin araştırarak öğrenmiş olursun
            AuthTextfield(
              colors: colors,
              iconPath: 'assets/auth-icon/mail.png',
              hintText: 'Email',
            ),
            const SizedBox(height: 20),
            AuthTextfield(
              colors: colors,
              iconPath: 'assets/auth-icon/password.png',
              hintText: 'Password',
            ),

            const SizedBox(height: 40),
            AuthButton(colors: colors, onTap: (){Navigator.pushReplacementNamed(context, Routes.home);},),
            SizedBox(height: 25),
            Text(
              "or use social media",
              style: TextStyle(
                color: colors.login.orContinueSocialButtonColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            // buradaki butonlar reacttaki component mantığı gibi
            // google ile giriş butonu
            AlternatifLoginButton(
              colors: colors,
              iconPath: 'assets/auth-icon/google.png',
              buttonText: "Sign in with Google",
              bgColor: colors.login.googleSignInBgColor,
              textColor: colors.login.googleSignInTextColor,
            ),
            const SizedBox(height: 10),
            //apple ile giriş butonu
            AlternatifLoginButton(
              colors: colors,
              iconPath: 'assets/auth-icon/apple.png',
              buttonText: "Sign in with Apple",
              bgColor: colors.login.appleSignInBgColor,
              textColor: colors.login.appleSignInTextColor,
            ),
          ],
        ),
      ),
    );
  }
}


