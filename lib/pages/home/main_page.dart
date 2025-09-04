import 'package:cerebria/pages/drawer/drawer_page.dart';
import 'package:cerebria/pages/home/home_page.dart';
import 'package:cerebria/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final colors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: colors.home.pageBgColor1,
      body: Stack(
        children: [
          DrawerPage(),
          HomePage()
        ],
      ),
    );
  }
}