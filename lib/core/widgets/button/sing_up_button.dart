import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/cupertino.dart';
import '../../themes/app_colors.dart';

class SingUpButton extends StatelessWidget {
  const SingUpButton({
    super.key,
    required this.colors,
    this.onTap,
  });

  final AppColors colors;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          text: "Still haven't signed up? ",
          style: TextStyle(
            color: colors.auth.orContinueSocialButtonColor,
            fontSize: AppFontSizes.s12,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "Sign Up",
              style: TextStyle(
                color: colors.auth.buttonBgColor,
                fontSize: AppFontSizes.s12,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
