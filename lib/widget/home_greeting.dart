import 'package:flutter/material.dart';
import 'package:cerebria/themes/app_colors.dart';

class HomeGreeting extends StatelessWidget {
  final AppColors colors;
  final String username;
  final String subtitle;
  final String dailyGoalStatus;

  const HomeGreeting({
    Key? key,
    required this.colors,
    required this.username,
    required this.subtitle,
    required this.dailyGoalStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Kullanıcı ismi
        Text(
          "Hello $username",
          style: TextStyle(
            color: colors.home.mainContainerTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),

        // Alt başlık
        Text(
          subtitle,
          style: TextStyle(
            color: colors.home.mainContainerTextColor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),

        // Günlük hedef durumu
        Text(
          "Daily goal status: $dailyGoalStatus",
          style: TextStyle(
            color: colors.home.mainContainerTextColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
