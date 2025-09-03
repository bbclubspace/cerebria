import 'package:cerebria/routes/routes.dart';
import 'package:cerebria/pages/auth/login_page.dart';
import 'package:cerebria/pages/home/home_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // uygulama çalışında debug diye bir flag oluyor ekranda onu kapadım
      debugShowCheckedModeBanner: false,
      // başlangıç olarak logini belirledim routes sınıfı üzerinden
      initialRoute: Routes.login,
      // uygulama içindeki tüm routelar burada belirtilecek ve yönetilecek
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.login: (context) => const LoginPage(),
      },
    );
  }
}
