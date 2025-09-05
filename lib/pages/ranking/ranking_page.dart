import 'package:cerebria/constants/user_rank_data.dart';
import 'package:cerebria/themes/app_colors.dart';
import 'package:cerebria/widget/page_top_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/user_rank_detail.dart';
import '../../widget/ranking/time_selector.dart';
import '../../widget/ranking/top_ranked_card.dart';
import '../../widget/ranking/other_rank_item.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  String selectedTime = "Weekly";

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, dynamic>> timeOptions = [
      {"label": "Weekly", "color": colors.ranking.weeklyContainerColor},
      {"label": "Monthly", "color": colors.ranking.monthlyContainerColor},
      {"label": "All Times", "color": colors.ranking.allTimesContainerColor},
    ];

    List<UserRankDetail> sortedRanks = List.from(userRankDetail);
    sortedRanks.sort((a, b) => b.point.compareTo(a.point));
    List<UserRankDetail> topThree = sortedRanks.take(3).toList();
    List<UserRankDetail> others = sortedRanks.skip(3).toList();

    return Scaffold(
      backgroundColor: colors.ranking.pageBgColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.03),
            PageTopItem(colors: colors, pageName: "Ranking"),
            SizedBox(height: screenHeight * 0.03),
            // Time Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: timeOptions.map((option) {
                final String value = option["label"];
                final Color bgColor = option["color"];
                return TimeSelector(
                  value: value,
                  containerColor: bgColor,
                  textColor: colors.ranking.timesTextColor,
                  strokeColor: colors.ranking.strokeColor,
                  isSelected: selectedTime == value,
                  onTap: () {
                    setState(() {
                      selectedTime = value;
                    });
                  },
                );
              }).toList(),
            ),

            SizedBox(height: screenHeight * 0.02),

            // Top 3 Ranking
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TopRankCard(
                  user: topThree[1],
                  medalAsset: "assets/ranking-page-icon/second.png",
                  avatarAsset: "assets/ranking-page-icon/rank-user2.png",
                  avatarSize: screenWidth * 0.12,
                  containerWidth: screenWidth * 0.18,
                  containerHeight: screenHeight * 0.12,
                ),
                TopRankCard(
                  user: topThree[0],
                  medalAsset: "assets/ranking-page-icon/first.png",
                  avatarAsset: "assets/ranking-page-icon/rank-user1.png",
                  avatarSize: screenWidth * 0.14,
                  containerWidth: screenWidth * 0.2,
                  containerHeight: screenHeight * 0.18,
                ),
                TopRankCard(
                  user: topThree[2],
                  medalAsset: "assets/ranking-page-icon/third.png",
                  avatarAsset: "assets/ranking-page-icon/rank-user3.png",
                  avatarSize: screenWidth * 0.11,
                  containerWidth: screenWidth * 0.16,
                  containerHeight: screenHeight * 0.1,
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.02),

            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Icon(Icons.bar_chart),
                    SizedBox(width: 8),
                    Text(
                      "$selectedTime ranking",
                      style: TextStyle(
                        color: colors.ranking.timesTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.01),

            // Others Ranking List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: others.length,
                itemBuilder: (context, index) {
                  return OtherRankItem(
                    user: others[index],
                    rankIndex: index + 4,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}








