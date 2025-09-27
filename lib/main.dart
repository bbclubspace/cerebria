import 'package:cerebria/core/utils/page_transitions.dart';
import 'package:cerebria/features/home/presentation/pages/main_page.dart';
import 'package:cerebria/features/module/logic/flashcard/flash_card_cubit.dart';
import 'package:cerebria/features/module/logic/listening/listening_cubit.dart';
import 'package:cerebria/features/module/logic/quiz/quiz_cubit.dart';
import 'package:cerebria/features/module/logic/writing/writing_cubit.dart';
import 'package:cerebria/features/module/presentation/pages/module_page.dart';
import 'package:cerebria/features/module/presentation/pages/vocabulary/exercise/flash/flash_test.dart';
import 'package:cerebria/features/module/presentation/pages/vocabulary/exercise/listening/listening_exercise.dart';
import 'package:cerebria/features/module/presentation/pages/vocabulary/exercise/quiz/quiz_exercise.dart';
import 'package:cerebria/features/module/presentation/pages/vocabulary/exercise/writing/writing_page.dart';
import 'package:cerebria/features/ranking/presentation/pages/ranking_page.dart';
import 'package:cerebria/features/module/presentation/pages/reading/reading_page.dart';
import 'package:cerebria/features/report/presentation/pages/report_page.dart';
import 'package:cerebria/features/module/presentation/pages/vocabulary/vocabulary_page.dart';
import 'package:cerebria/features/module/presentation/pages/vocabulary/vocabulary_list_page.dart';
import 'package:cerebria/features/module/presentation/pages/listening/listening_page.dart';
import 'package:cerebria/features/module/presentation/pages/grammer/grammer_page.dart';
import 'package:cerebria/features/module/presentation/pages/speaking/speaking_page.dart';
import 'package:cerebria/features/module/presentation/pages/exam/exam_page.dart';
import 'package:cerebria/core/routes/routes.dart';
import 'package:cerebria/features/auth/presentation/pages/login_page.dart';
import 'package:cerebria/features/auth/presentation/pages/sing_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'features/report/logic/cubit/report_cubit.dart';
import 'features/report/data/services/report_services.dart';

void main() {
  runApp(
    ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ReportsCubit>(
              create: (_) => ReportsCubit(ReportServices())..loadReports(),
            ),
            BlocProvider<QuizCubit>(create: (_) => QuizCubit()),
            BlocProvider<WritingCubit>(create: (_) => WritingCubit()),
            BlocProvider<ListeningCubit>(create: (_) => ListeningCubit()),
            BlocProvider<FlashCubit>(create: (_) => FlashCubit()),
          ],
          child: const MainApp(),
        );
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = <String, WidgetBuilder>{
      Routes.home: (context) => const MainPage(),
      Routes.login: (context) => const LoginPage(),
      Routes.sing_up: (context) => const SignUpPage(),
      Routes.module_page: (context) => const ModulePage(),
      Routes.reading_page: (context) => const ReadingPage(),
      Routes.vocabulary_page: (context) => const VocabularyPage(),
      Routes.vocabulary_list_page: (context) => const VocabularyListPage(),
      Routes.vocabulary_flash_exercise: (context) => const FlashTest(),
      Routes.vocabulary_quiz_exercise: (context) => const QuizExercise(),
      Routes.vocabulary_writing_page: (context) => const WritingPage(),
      Routes.vocabulary_listening_page: (context) => const ExerciseListeningPage(),
      Routes.listening_page: (context) => const ListeningPage(),
      Routes.grammer_page: (context) => const GrammerPage(),
      Routes.speaking_page: (context) => const SpeakingPage(),
      Routes.exam_page: (context) => const ExamPage(),
      Routes.ranking_page: (context) => const RankingPage(),
      Routes.report_page: (context) => const ReportPage(),
      Routes.profile: (context) => const ProfilePage(),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      onGenerateRoute: (settings) {
        final builder = routes[settings.name];
        if (builder != null) {
          return pageTransition(builder(context));
        }
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page not found")),
          ),
        );
      },
    );
  }
}
