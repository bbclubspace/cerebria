import 'login/login_colors.dart';
import 'home/home_colors.dart';

class AppColors {
  // her sayfa için klasör yapısı oluşturup burada nesnesini oluşturucaz
  // temiz kod olması açısından
  // önceden tek sayfada yazıyordum yönetmesi zor oluyor
  final LoginColors login;
  final HomeColors home;

  // dark mode renklerini rastgele koydum şuan ileride ayarlarız renkleri
  AppColors({required bool isDarkMode})
      : login = LoginColors(isDarkMode: isDarkMode),
        home = HomeColors(isDarkMode: isDarkMode);
}
