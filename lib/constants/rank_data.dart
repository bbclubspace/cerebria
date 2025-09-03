import '../model/rank_model.dart';
import '../themes/app_colors.dart';

// colors parametresini fonksiyona geçiriyoruz
List<Rank> getRanks(AppColors colors) {
  return [
    Rank(
      iconPath: "assets/homepage-icon/high-score.png",
      title: "Score",
      value: "1350",
      bgColor: colors.home.rankContainerColor1,
    ),
    Rank(
      iconPath: "assets/homepage-icon/daily.png",
      title: "Series",
      value: "20",
      bgColor: colors.home.rankContainerColor2,
    ),
    Rank(
      iconPath: "assets/homepage-icon/ranking.png",
      title: "Ranking",
      value: "#20",
      bgColor: colors.home.rankContainerColor3,
    ),
  ];
}
