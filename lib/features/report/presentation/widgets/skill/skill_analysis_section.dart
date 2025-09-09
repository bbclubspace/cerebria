import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../module/data/model/module_item.dart';
import 'skill_analysis_widget.dart';

class SkillAnalysisSection extends StatelessWidget {
  final AppColors colors;
  final List<ModuleItem> modules;

  const SkillAnalysisSection({super.key, required this.colors, required this.modules});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: modules.map((module) => Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: SkillAnalysisWidget(item: module, colors: colors),
      )).toList(),
    );
  }
}
