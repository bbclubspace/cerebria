import 'package:flutter/material.dart';
import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/widgets/page_top_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cerebria/core/themes/vocabulary/vocabulary_list_color.dart';
import '../../widgets/word_list_item.dart';
import 'create_list_dialog.dart';
import 'word_list_detail_page.dart';
import '../../../data/model/list_item.dart';
import '../../../../../core/constants/module/vocabulary/list_item.dart';

class VocabularyListPage extends StatefulWidget {
  const VocabularyListPage({Key? key}) : super(key: key);

  @override
  State<VocabularyListPage> createState() => _VocabularyListPage();
}

class _VocabularyListPage extends State<VocabularyListPage> {
  String _activeTab = 'ready'; // 'ready' veya 'my'
  final color = VocabularyListColors(isDarkMode: false);

  // Özel listeler (model kullanıyoruz artık)
  List<ListItem> _myLists = [];

  @override
  Widget build(BuildContext context) {
    final appColors = AppColors(isDarkMode: false);
    return Scaffold(
      backgroundColor: appColors.module.pageBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50.h),
          // back button and page name
          PageTopItem(colors: appColors, pageName: "Word Lists"),
          SizedBox(height: 16.h),

          // Tab bar
          _buildTabBar(),

          // Dinamik içerik
          Expanded(
            child: _activeTab == 'ready' ? _buildReadyLists() : _buildMyLists(),
          ),
        ],
      ),
      // List add button
      floatingActionButton: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () async {
            final result = await CreateListDialog.show(context);

            if (result != null) {
              setState(() {
                _myLists.add(
                  ListItem(
                    title: result['title'] ?? '',
                    subtitle: result['subtitle'] ?? '',
                    category: result['category'] ?? '',
                    wordCount: result['wordCount'] ?? 0,
                    level: result['level'] ?? 'Beginner',
                    progressPercentage: result['progressPercentage'] ?? 0,
                    progressColor: result['progressColor'] ?? Colors.blue,
                  ),
                );
                _activeTab = 'my';
              });
            }
          },
          child: Image.asset(
            "assets/module-icon/add-icon.png",
            width: 75.w,
            height: 75.h,
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(child: _buildTabButton('Ready Lists', 'ready')),
          SizedBox(height: 10.h, width: 10.w),
          Expanded(child: _buildTabButton('My Lists', 'my')),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, String tabName) {
    final bool isActive = _activeTab == tabName;
    Color bgColor;
    Color fgColor;

    if (tabName == 'ready') {
      bgColor = isActive ? color.readyAktifColor : color.readyPasifColor;
      fgColor = isActive ? color.readyPasifColor : color.readyAktifColor;
    } else {
      bgColor = isActive ? color.myAktifColor : color.myPasifColor;
      fgColor = isActive ? color.myPasifColor : color.myAktifColor;
    }

    return ElevatedButton(
      onPressed: () {
        setState(() {
          _activeTab = tabName;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 15),
        elevation: 2,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 15.0.h, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Hazır listeler
  Widget _buildReadyLists() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      itemCount: vocabularyLists.length,
      itemBuilder: (context, index) {
        final item = vocabularyLists[index];
        return WordListItem(
          title: item.title,
          subtitle: item.subtitle,
          category: item.category,
          wordCount: item.wordCount,
          level: item.level,
          progressPercentage: item.progressPercentage,
          progressColor: item.progressColor,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WordListDetailPage(listData: item),
              ),
            );
          },
        );
      },
    );
  }

  // Benim listelerim
  Widget _buildMyLists() {
    if (_myLists.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list_alt, size: 64.w, color: color.listAltIconColor),
            SizedBox(height: 16.h),
            Text(
              'No custom lists yet',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: color.noMyListTextColor,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Tap the + button to create your first list',
              style: TextStyle(fontSize: 14.sp, color: color.noMyListTextColor),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      itemCount: _myLists.length,
      itemBuilder: (context, index) {
        final item = _myLists[index];
        return WordListItem(
          title: item.title,
          subtitle: item.subtitle,
          category: item.category,
          wordCount: item.wordCount,
          level: item.level,
          progressPercentage: item.progressPercentage,
          progressColor: item.progressColor,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WordListDetailPage(listData: item),
              ),
            );
          },
        );
      },
    );
  }
}
