import 'package:cerebria/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/daily_content_data.dart';
import '../../constants/rank_data.dart';
import '../../widget/container/daily_content_status.dart';
import '../../widget/container/rank_and_ach_container.dart';
import '../../widget/home_greeting.dart';
import '../../widget/progressbar/progress_bar.dart';
import '../../widget/top_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // renk sınıfımızdan nesnesini oluşturuyoruz isdark mode şimdilik false burayı state manangement ile değiştircez sonra
    final colors = AppColors(isDarkMode: false);
    //default rank verileri ekledim buraya kodda yer kaplamaması için
    final ranks = getRanks(colors);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colors.home.pageBgColor1, colors.home.pageBgColor2],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              //menü, uygulama ismi, seçilen dil
              //kodda çok yer kaplamaması için
              TopWidget(colors: colors),
              const SizedBox(height: 20),
              Container(
                width: 347,
                height: 246,
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
                  children: [
                    const SizedBox(height: 5),
                    // isim falan onun içeriği
                    HomeGreeting(
                      colors: colors,
                      username: "Levent",
                      subtitle: "What would you like to learn today?",
                      dailyGoalStatus: "%40",
                    ),

                    const SizedBox(height: 10),
                    // ilerleme çubuğu value değeri şuan 0.4 ile sabit bunu ilerde içeriğe göre ayarlıcaz
                    ProgressBar(colors: colors),
                    const SizedBox(height: 30),

                    // burada row row içerisinde de verebilirdim fakat kodda çok yer kaplıyor ve dinamik değil
                    // sürekli yeni bir şey geldiğinde elle eklememiz gerekiyor
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          //default veri oluşturdum kullanmak için ilerde veritabanından gelicek onun uzunluğu kadar
                          itemCount: dailyContents.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 30),
                          itemBuilder: (context, index) {
                            final item = dailyContents[index];
                            return DailyContentStatus(
                              // daily content için bir model sınıfı oluşturup onun tipinde liste oluşturmuştum 
                              // constants -> daily_content_data.dart içerisinde bakabilirsin
                              iconPath: item.iconPath,
                              title: item.title,
                              value: item.value,
                              colors: colors,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // rank ve achievement
              Text(
                "Rank and Achievements",
                style: TextStyle(
                  color: colors.home.titleTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              // daily content yapısına benzer yapı
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: ranks.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
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
            ],
          ),
        ),
      ),
    );
  }
}
