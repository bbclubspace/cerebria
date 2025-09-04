import 'package:cerebria/themes/drawer/drawer_colors.dart';

import 'auth/auth_colors.dart';
import 'home/home_colors.dart';

class AppColors {
  // her sayfa için klasör yapısı oluşturup burada nesnesini oluşturucaz
  // temiz kod olması açısından
  // önceden tek sayfada yazıyordum yönetmesi zor oluyor
  final AuthColors auth;
  final HomeColors home;
  final DrawerColors drawer;

  // dark mode renklerini rastgele koydum şuan ileride ayarlarız renkleri
  AppColors({required bool isDarkMode})
      : auth = AuthColors(isDarkMode: isDarkMode),
        home = HomeColors(isDarkMode: isDarkMode),
        drawer = DrawerColors(isDarkMode: isDarkMode);
}
