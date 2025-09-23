import 'package:cerebria/core/constants/drawer_item.dart';
import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routes/routes.dart';

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
        padding:  EdgeInsets.only(top: 0, left: 0,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             SizedBox(height: 100.h),
            NewRow(text: 'Home page', iconPath: drawerIcons['home']!,route: Routes.home,),
             SizedBox(height: 20.h),
            NewRow(text: 'Report', iconPath: drawerIcons['report']!,route: Routes.report_page,),
             SizedBox(height: 20.h),
            NewRow(text: 'Ranking', iconPath: drawerIcons['ranking']!,route: Routes.ranking_page,),
             SizedBox(height: 20.h),
            NewRow(text: 'Messaging', iconPath: drawerIcons['messaging']!,route: Routes.home,),
             SizedBox(height: 20.h),
            NewRow(text: 'Profile', iconPath: drawerIcons['profile']!,route: Routes.profile,),
             SizedBox(height: 20.h),
            NewRow(text: 'Logout', iconPath: drawerIcons['logout']!,route: Routes.home,),
          ],
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final String iconPath;
  final String text;
  final route;

  const NewRow({super.key, required this.iconPath, required this.text, this.route});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Row(
        children: [
          SizedBox(
            width: 50.w,
            height: 50.h,
            child: SvgPicture.asset(iconPath, fit: BoxFit.contain),
          ),
           SizedBox(width: 5.w),
          Text(
            text,
            style: TextStyle(
              color: colors.drawer.textColor,
              fontWeight: FontWeight.w400,
              fontSize: AppFontSizes.s12
            ),
          ),
        ],
      ),
    );
  }
}
