import 'package:cerebria/core/constants/user_rank_data.dart';
import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/widgets/page_top_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/user_rank_detail.dart';
import '../widgets/ranking/time_selector.dart';
import '../widgets/ranking/top_ranked_card.dart';
import '../widgets/ranking/other_rank_item.dart';

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
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  PageTopItem(colors: colors, pageName: "Ranking"),
                  SizedBox(height: 40.h),

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

                  SizedBox(height: 10.h),

                  // Top 3 Ranking
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TopRankCard(
                        user: topThree[1],
                        medalAsset: "assets/ranking-page-icon/second.png",
                        avatarAsset: "assets/ranking-page-icon/rank-user2.png",
                        avatarSize: 50.w,
                        containerWidth: 64.w,
                        containerHeight: 95.h,
                      ),
                      TopRankCard(
                        user: topThree[0],
                        medalAsset: "assets/ranking-page-icon/first.png",
                        avatarAsset: "assets/ranking-page-icon/rank-user1.png",
                        avatarSize: 50.w,
                        containerWidth: 64.w,
                        containerHeight: 150.h,
                      ),
                      TopRankCard(
                        user: topThree[2],
                        medalAsset: "assets/ranking-page-icon/third.png",
                        avatarAsset: "assets/ranking-page-icon/rank-user3.png",
                        avatarSize: 50.w,
                        containerWidth: 64.w,
                        containerHeight: 60.h,
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),

                  // Title
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.bar_chart),
                        SizedBox(width: 8.w),
                        Text(
                          "$selectedTime ranking",
                          style: TextStyle(
                            color: colors.ranking.timesTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.h,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 5.h),

                  // Others Ranking List
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
