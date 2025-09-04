import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../routes/routes.dart';
import '../../themes/app_colors.dart';
import '../../widget/text/auth_title_text.dart';
import '../../widget/textfield/auth_textfield.dart';
import '../../widget/button/auth_button.dart';
import '../../widget/button/alternatif_login_button.dart';
import '../../widget/button/back_button.dart' as CustomButton;

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: colors.login.pageBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // BackButton'u en üstte ve sola hizalı olarak yerleştir
              Align(
                alignment: Alignment.topLeft,
                child: CustomButton.BackButton(
                  iconPath: 'assets/auth-icon/back.png',
                  colors: colors,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                ),
              ),
              // Kalan içeriği ortala
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthTitleText(colors: colors, title: "Sign Up"),
                      AuthTitleText(colors: colors, title: "Community"),
                      const SizedBox(height: 40),
                      AuthTextfield(
                        colors: colors,
                        iconPath: 'assets/auth-icon/person.png',
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 20),
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
                      AuthButton(
                        colors: colors,
                        onTap: () {
                          Navigator.pushReplacementNamed(context, Routes.home);
                        },
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "or use social media",
                        style: TextStyle(
                          color: colors.login.orContinueSocialButtonColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 25),
                      // Google ile giriş butonu
                      AlternatifLoginButton(
                        colors: colors,
                        iconPath: 'assets/auth-icon/google.png',
                        buttonText: "Sign up with Google",
                        bgColor: colors.login.googleSignInBgColor,
                        textColor: colors.login.googleSignInTextColor,
                      ),
                      const SizedBox(height: 10),
                      // Apple ile giriş butonu
                      AlternatifLoginButton(
                        colors: colors,
                        iconPath: 'assets/auth-icon/apple.png',
                        buttonText: "Sign up with Apple",
                        bgColor: colors.login.appleSignInBgColor,
                        textColor: colors.login.appleSignInTextColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
