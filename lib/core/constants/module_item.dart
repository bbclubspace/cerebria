import '../../features/module/data/model/module_item.dart';
import '../themes/app_colors.dart';
import '../routes/routes.dart';

final colors = AppColors(isDarkMode: false);

final List<ModuleItem> modules = [
  ModuleItem(
    name: 'Reading',
    iconPath: "assets/content-icon/read.png",
    color: colors.module.moduleContainerColor1,
    route: Routes.reading_page,
  ),
  ModuleItem(
    name: 'Vocabulary',
    iconPath: "assets/content-icon/vocabulary.png",
    color: colors.module.moduleContainerColor5,
    route: Routes.vocabulary_page,
  ),
  ModuleItem(
    name: 'Listening',
    iconPath: "assets/content-icon/listening.png",
    color: colors.module.moduleContainerColor2,
    route: Routes.listening_page,
  ),
  ModuleItem(
    name: 'Grammer',
    iconPath: "assets/content-icon/idea.png",
    color: colors.module.moduleContainerColor3,
    route: Routes.grammer_page,
  ),
  ModuleItem(
    name: 'Speaking',
    iconPath: "assets/content-icon/talking.png",
    color: colors.module.moduleContainerColor4,
    route: Routes.speaking_page,
  ),
  ModuleItem(
    name: 'Exam',
    iconPath: "assets/content-icon/exam.png",
    color: colors.module.moduleContainerColor6,
    route: Routes.exam_page,
  ),
];
