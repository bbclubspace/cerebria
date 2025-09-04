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
            color: colors.login.orContinueSocialButtonColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "Sign Up",
              style: TextStyle(
                color: colors.login.buttonBgColor,
                fontSize: 20,
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
