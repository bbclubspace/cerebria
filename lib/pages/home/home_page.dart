import 'package:cerebria/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/module_item.dart';
import 'package:flutter/material.dart';
import '../../constants/daily_content_data.dart';
import '../../constants/rank_data.dart';
import '../../routes/routes.dart';
import '../../widget/container/daily_content_status.dart';
import '../../widget/container/rank_and_ach_container.dart';
import '../../widget/home_greeting.dart';
import '../../widget/progressbar/progress_bar.dart';
import '../../widget/top_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    // renk sınıfımızdan nesnesini oluşturuyoruz isdark mode şimdilik false burayı state manangement ile değiştircez sonra
    final colors = AppColors(isDarkMode: false);
    //default rank verileri ekledim buraya kodda yer kaplamaması için
    final ranks = getRanks(colors);
    return AnimatedContainer(
      height: double.infinity,
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: isDrawerOpen
            ? BorderRadius.circular(40)
            : BorderRadius.circular(0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colors.home.pageBgColor1, colors.home.pageBgColor2],
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              //menü, uygulama ismi, seçilen dil
              //kodda çok yer kaplamaması için
              TopWidget(
                colors: colors,
                onTapMenu: () {
                  if (isDrawerOpen) {
                    setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      isDrawerOpen = false;
                    });
                  } else {
                    setState(() {
                      xOffset = 290;
                      yOffset = 80;
                      isDrawerOpen = true;
                    });
                  }
                },
              ),
              SizedBox(height: 20.h),
              Container(
                width: 405.w,
                height: 246.h,
                decoration: BoxDecoration(
                  //3 farklı renk vardı mor olan containerda gradient yapısı ile verebiliyoruz bunu
                  gradient: LinearGradient(
                    colors: [
                      colors.home.mainContainerColor1,
                      colors.home.mainContainerColor2,
                      colors.home.mainContainerColor3,
                    ],
                  ),
                  // köşelerine ovallik verebilmek için
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h),
                    // isim falan onun içeriği
                    HomeGreeting(
                      colors: colors,
                      username: "Eda",
                      subtitle: "What would you like to learn today?",
                      dailyGoalStatus: "%20",
                    ),

                    SizedBox(height: 10.h),
                    // ilerleme çubuğu value değeri şuan 0.4 ile sabit bunu ilerde içeriğe göre ayarlıcaz
                    ProgressBar(colors: colors, value: 0.2),
                    SizedBox(height: 30.h),

                    // burada row row içerisinde de verebilirdim fakat kodda çok yer kaplıyor ve dinamik değil
                    // sürekli yeni bir şey geldiğinde elle eklememiz gerekiyor
                    SizedBox(
                      height: 100.h,
                      width: 330.w,
                      child: Center(
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: dailyContents.length,
                          separatorBuilder: (_, __) => SizedBox(width: 30.w),
                          itemBuilder: (context, index) {
                            final item = dailyContents[index];
                            return Center(
                              child: DailyContentStatus(
                                iconPath: item.iconPath,
                                title: item.title,
                                value: item.value,
                                colors: colors,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              // rank ve achievement
              Text(
                "Rank and Achievements",
                style: TextStyle(
                  color: colors.home.titleTextColor,
                  fontSize: 20.h,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10.h),
              // daily content yapısına benzer yapı
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: SizedBox(
                  height: 120.h,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: ranks.length,
                    separatorBuilder: (_, __) => SizedBox(width: 10.w),
                    itemBuilder: (context, index) {
                      final item = ranks[index];
                      return RankAndAchContainer(
                        colors: colors,
                        bgColor: item.bgColor,
                        iconPath: item.iconPath,
                        title: item.title,
                        value: item.value,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Modules",
                      style: TextStyle(
                        color: colors.home.titleTextColor,
                        fontSize: 20.h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.module_page);
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: colors.home.modulLinkColor,
                          fontSize: 16.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Moduller
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Scroll çatışmasını çözüyor
                mainAxisSpacing: 16.w,
                crossAxisSpacing: 16.w,
                childAspectRatio: 160.w / 120.h,
                padding: const EdgeInsets.symmetric(horizontal: 2),
                children: modules.take(4).map((item) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, item.route);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            Image.asset(
                              item.iconPath,
                              width: 40.w,
                              height: 40.h,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              item.name,
                              style: TextStyle(
                                color: colors.module.moduleContainerTextColor,
                                fontSize: 20.h,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 40.h,)
            ],
          ),
        ),
      ),
    );
  }
}
