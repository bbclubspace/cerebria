import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/module_item.dart';
import '../../cubit/report/report_cubit.dart';
import '../../cubit/report/report_state.dart';
import '../../services/report_services.dart';
import '../../themes/app_colors.dart';
import '../../constants/report_constants.dart';
import '../../widget/module-item/title_text.dart';
import '../../widget/reportpage/calendar/calendar_section.dart';
import '../../widget/reportpage/completed_excercise_section.dart';
import '../../widget/reportpage/statistics/grammatical_weakness_section.dart';
import '../../widget/reportpage/skill/skill_analysis_section.dart';
import '../../widget/page_top_item.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportsCubit(ReportServices())..loadReports(),
      child: const _ReportPageContent(),
    );
  }
}

class _ReportPageContent extends StatelessWidget {
  const _ReportPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsCubit, ReportsState>(
      builder: (context, state) {
        final cubit = context.read<ReportsCubit>();
        final colors = AppColors(isDarkMode: false);
        final ranks = ReportConstants.getReportItem(colors);

        return Scaffold(
          backgroundColor: colors.report.pageBgColor,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  PageTopItem(colors: colors, pageName: "Reports"),
                  SizedBox(height: 20.h),

                  // takvim
                  CalendarSection(
                    colors: colors,
                    cubit: cubit,
                    colorItem: colors.report.calendarColors,
                  ),

                  SizedBox(height: 15.h),
                  // soru sayısı, çalışma saati, seri
                  CompletedExerciseSection(colors: colors, ranks: ranks),

                  SizedBox(height: 15.h),
                  TitleText(colors: colors, title: "Skill Analysis"),
                  SizedBox(height: 5.h),
                  // modullerde seviye içeriği
                  SkillAnalysisSection(
                    colors: colors,
                    modules: modules.take(4).toList(),
                  ),

                  SizedBox(height: 15.h),
                  // sorularda yapılan hata kısmı
                  GrammaticalWeaknessSection(
                    colors: colors,
                    colorsList: colors.report.grammarWeakColors,
                    contentList: ReportConstants.examples,
                  ),

                  SizedBox(height: 15.h),
                  GrammaticalWeaknessSection(
                    colors: colors,
                    colorsList: colors.report.questionTypeColors,
                    contentList: ReportConstants.examples,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
