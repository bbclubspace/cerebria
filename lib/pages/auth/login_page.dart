import 'package:cerebria/widget/button/alternatif_login_button.dart';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';
import '../../themes/app_colors.dart';
import '../../widget/button/auth_button.dart';
import '../../widget/button/sing_up_button.dart';
import '../../widget/text/auth_title_text.dart';
import '../../widget/textfield/auth_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppColors sınıfının nesnesini oluşturduk darkmode default false verdik ilerde bunu state manangement ile yöneticez
    final colors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: colors.auth.pageBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics:const  BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.only(left: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // flutterda boşluk bırakmak için bu widget kullanılıyor
                 SizedBox(height: 100.h),
                // giriş ekranındaki title
                AuthTitleText(colors: colors, title: "Join"),
                AuthTitleText(colors: colors, title: "Community"),
                AuthTitleText(colors: colors, title: "Learning"),
          
                 SizedBox(height: 40.h),
                //component mantığı ile kullanıcı girişi ile textfield oluşturduk
                //controller değişkenleri eklenmedi şuan girdileri işleyemiyoruz
                // istersen sen eklemeyi deneyebilirsin araştırarak öğrenmiş olursun
                AuthTextfield(
                  colors: colors,
                  iconPath: 'assets/auth-icon/mail.png',
                  hintText: 'Email',
                ),
                 SizedBox(height: 20.h),
                AuthTextfield(
                  colors: colors,
                  iconPath: 'assets/auth-icon/password.png',
                  hintText: 'Password',
                ),
          
                 SizedBox(height: 40.h),
                AuthButton(
                  colors: colors,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.home);
                  },
                ),
                SizedBox(height: 15.h),
                Text(
                  "or use social media",
                  style: TextStyle(
                    color: colors.auth.orContinueSocialButtonColor,
                    fontSize: 20.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 25.h),
          
                // buradaki butonlar reacttaki component mantığı gibi
                // google ile giriş butonu
                AlternatifLoginButton(
                  colors: colors,
                  iconPath: 'assets/auth-icon/google.png',
                  buttonText: "Sign in with Google",
                  bgColor: colors.auth.googleSignInBgColor,
                  textColor: colors.auth.googleSignInTextColor,
                ),
                 SizedBox(height: 10.h),
                //apple ile giriş butonu
                AlternatifLoginButton(
                  colors: colors,
                  iconPath: 'assets/auth-icon/apple.png',
                  buttonText: "Sign in with Apple",
                  bgColor: colors.auth.appleSignInBgColor,
                  textColor: colors.auth.appleSignInTextColor,
                ),
          
                 SizedBox(height: 20.h),
                SingUpButton(
                  colors: colors,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.sing_up);
                  },
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
