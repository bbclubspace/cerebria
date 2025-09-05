import '../model/module_item.dart';
import '../themes/app_colors.dart';

final colors = AppColors(isDarkMode: false);

final List<ModuleItem> modules = [
  ModuleItem(
    name: 'Reading',
    iconPath: "assets/content-icon/read.png",
    color: colors.module.moduleContainerColor1,
  ),
  ModuleItem(
    name: 'Vocabulary',
    iconPath: "assets/content-icon/vocabulary.png",
    color: colors.module.moduleContainerColor5,
  ),
  ModuleItem(
    name: 'Listening',
    iconPath: "assets/content-icon/listening.png",
    color: colors.module.moduleContainerColor2,
  ),
  ModuleItem(
    name: 'Grammer',
    iconPath: "assets/content-icon/idea.png",
    color: colors.module.moduleContainerColor3,
  ),
  ModuleItem(
    name: 'Speaking',
    iconPath: "assets/content-icon/talking.png",
    color: colors.module.moduleContainerColor4,
  ),
  ModuleItem(
    name: 'Exam',
    iconPath: "assets/content-icon/exam.png",
    color: colors.module.moduleContainerColor6,
  ),
];
