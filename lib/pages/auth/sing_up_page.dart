import 'package:cerebria/utils/font_size.dart';
import 'package:cerebria/widget/button/alternatif_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routes/routes.dart';
import '../../themes/app_colors.dart';
import '../../widget/button/app_back_button.dart';
import '../../widget/text/auth_title_text.dart';
import '../../widget/textfield/auth_textfield.dart';
import '../../widget/button/auth_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: colors.auth.pageBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: AppBackButton(
                  iconPath: 'assets/auth-icon/back.png',
                  colors: colors,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                ),
              ),
              // Kalan içeriği ortala
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthTitleText(colors: colors, title: "Sign Up"),
                      AuthTitleText(colors: colors, title: "Community"),
                      SizedBox(height: 40.h),
                      AuthTextfield(
                        colors: colors,
                        iconPath: 'assets/auth-icon/person.png',
                        hintText: 'Name',
                      ),
                      SizedBox(height: 20.h),
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
                      SizedBox(height: 25.h),
                      Text(
                        "or use social media",
                        style: TextStyle(
                          color: colors.auth.orContinueSocialButtonColor,
                          fontSize: AppFontSizes.s12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      // Google ile giriş butonu
                      AlternatifLoginButton(
                        colors: colors,
                        iconPath: 'assets/auth-icon/google.png',
                        buttonText: "Sign up with Google",
                        bgColor: colors.auth.googleSignInBgColor,
                        textColor: colors.auth.googleSignInTextColor,
                      ),
                      SizedBox(height: 10.h),
                      // Apple ile giriş butonu
                      AlternatifLoginButton(
                        colors: colors,
                        iconPath: 'assets/auth-icon/apple.png',
                        buttonText: "Sign up with Apple",
                        bgColor: colors.auth.appleSignInBgColor,
                        textColor: colors.auth.appleSignInTextColor,
                      ),
                    ],
                  ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
