import 'package:cerebria/constants/drawer_item.dart';
import 'package:cerebria/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../routes/routes.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final colors = AppColors(isDarkMode: false);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors.drawer.pageBgColor1,
            colors.drawer.pageBgColor2,
            colors.drawer.pageBgColor3,
            colors.drawer.pageBgColor4,
          ],
          stops: [0.0, 0.26, 0.51, 0.75],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            NewRow(text: 'Home page', iconPath: drawerIcons['home']!),
            const SizedBox(height: 20),
            NewRow(text: 'Report', iconPath: drawerIcons['report']!),
            const SizedBox(height: 20),
            NewRow(text: 'Ranking', iconPath: drawerIcons['ranking']!),
            const SizedBox(height: 20),
            NewRow(text: 'Messaging', iconPath: drawerIcons['messaging']!),
            const SizedBox(height: 20),
            NewRow(text: 'Profile', iconPath: drawerIcons['profile']!),
            const SizedBox(height: 20),
            NewRow(text: 'Logout', iconPath: drawerIcons['logout']!),
          ],
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final String iconPath;
  final String text;

  const NewRow({super.key, required this.iconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, Routes.login);
      },
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: SvgPicture.asset(iconPath, fit: BoxFit.contain),
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(
              color: colors.drawer.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
