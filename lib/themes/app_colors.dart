import 'auth/auth_colors.dart';
import 'drawer/drawer_colors.dart';
import 'home/home_colors.dart';
import 'module/module_colors.dart';

class AppColors {
  final AuthColors auth;
  final HomeColors home;
  final DrawerColors drawer;
  final ModuleColors module;

  AppColors({required bool isDarkMode})
      : auth = AuthColors(isDarkMode: isDarkMode),
        home = HomeColors(isDarkMode: isDarkMode),
        drawer = DrawerColors(isDarkMode: isDarkMode),
        module = ModuleColors(isDarkMode: isDarkMode);
}
