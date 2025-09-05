import 'package:cerebria/pages/home/main_page.dart';
import 'package:cerebria/pages/module/module_page.dart';
import 'package:cerebria/pages/reading/reading_page.dart';
import 'package:cerebria/pages/vocabulary/vocabulary_page.dart';
import 'package:cerebria/pages/listening/listening_page.dart';
import 'package:cerebria/pages/grammer/grammer_page.dart';
import 'package:cerebria/pages/speaking/speaking_page.dart';
import 'package:cerebria/pages/exam/exam_page.dart';

import 'package:cerebria/routes/routes.dart';
import 'package:cerebria/pages/auth/login_page.dart';
import 'package:cerebria/pages/auth/sing_up_page.dart';
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
        // drawer ile homepage kontrolü için mainpage de birleştirdim
        Routes.home: (context) => const MainPage(),
        Routes.login: (context) => const LoginPage(),
        Routes.sing_up: (context) => const SignUpPage(),

        Routes.module_page: (context) => const ModulePage(),
        Routes.reading_page: (context) => const ReadingPage(),
        Routes.vocabulary_page: (context) => const VocabularyPage(),
        Routes.listening_page: (context) => const ListeningPage(),
        Routes.grammer_page: (context) => const GrammerPage(),
        Routes.speaking_page: (context) => const SpeakingPage(),
        Routes.exam_page: (context) => const ExamPage(),
      },
    );
  }
}
