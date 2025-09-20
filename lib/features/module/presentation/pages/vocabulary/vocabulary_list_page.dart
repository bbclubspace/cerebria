import 'package:flutter/material.dart';
import 'package:cerebria/core/themes/app_colors.dart';
import 'package:cerebria/core/widgets/page_top_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cerebria/core/themes/vocabulary/vocabulary_list_color.dart';
import '../../widgets/word_list_item.dart';
import 'create_list_dialog.dart';
import 'word_list_detail_page.dart';

class VocabularyListPage extends StatefulWidget {
  const VocabularyListPage({Key? key}) : super(key: key);

  @override
  State<VocabularyListPage> createState() => _VocabularyListPage();
}

class _VocabularyListPage extends State<VocabularyListPage> {
  // Aktif sekmeyi takip etmek için değişken
  String _activeTab = 'ready'; // 'ready' veya 'my'
  final color = VocabularyListColors(isDarkMode: false);

  // Özel listeler için liste
  List<Map<String, dynamic>> _myLists = [];

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

          // Özel Sekme Kontrolü (Custom Tab Bar)
          _buildTabBar(),
          // Dinamik içerik alanı
          Expanded(
            child: _activeTab == 'ready' ? _buildReadyLists() : _buildMyLists(),
          ),
        ],
      ),
      // List add button
      floatingActionButton: Material(
        color: Colors.transparent, // arka planı kaldır
        child: InkWell(
          borderRadius: BorderRadius.circular(100), // istersen dairesel ripple
          onTap: () async {
            // Dialog'u aç ve sonuç bekle
            final result = await CreateListDialog.show(context);

            // Eğer bir liste oluşturulduysa, listemi ekle
            if (result != null) {
              setState(() {
                _myLists.add(result);
                // Listeyi oluşturduktan sonra "My Lists" sekmesine geç
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

  // Sekme Çubuğunu Oluşturan Metot
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

  // Sekme Düğmelerini Oluşturan Metot
  Widget _buildTabButton(String text, String tabName) {
    final bool isActive = _activeTab == tabName;

    // Renkleri tab adına göre seçelim
    Color bgColor;
    Color fgColor;

    if (tabName == 'ready') {
      bgColor = isActive ? color.readyAktifColor : color.readyPasifColor;
      fgColor = isActive
          ? color.readyPasifColor
          : color.readyAktifColor; // Örnek olarak zıt renk
    } else {
      bgColor = isActive ? color.myAktifColor : color.myPasifColor;
      fgColor = isActive
          ? color.myPasifColor
          : color.myAktifColor; // Örnek olarak zıt renk
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
        // Buraya TextStyle ekliyoruz
        style: TextStyle(
          fontSize: 15.0.h, // İstediğiniz yazı boyutunu buraya yazın
          fontWeight: FontWeight.bold, // İsteğe bağlı
        ),
      ),
    );
  }

  // Hazır Listeleri Gösteren Widget
  Widget _buildReadyLists() {
    final List<Map<String, dynamic>> readyLists = [
      {
        'title': 'Essential Verbs',
        'subtitle': 'Günlük hayatta en çok kullanılan fiiller',
        'category': 'Verbs',
        'wordCount': 150,
        'level': 'Beginner',
        'progressPercentage': 65,
        'progressColor': Colors.blue,
      },
      {
        'title': 'Common Nouns',
        'subtitle': 'Temel isim kelimeleri',
        'category': 'Nouns',
        'wordCount': 200,
        'level': 'Beginner',
        'progressPercentage': 30,
        'progressColor': Colors.green,
      },
      {
        'title': 'Technology Terms',
        'subtitle': 'Teknoloji dünyasının temel terimleri',
        'category': 'Technology',
        'wordCount': 120,
        'level': 'Intermediate',
        'progressPercentage': 0,
        'progressColor': Colors.orange,
      },
      {
        'title': 'Business English',
        'subtitle': 'İş hayatında kullanılan kelimeler',
        'category': 'Business',
        'wordCount': 180,
        'level': 'Advanced',
        'progressPercentage': 15,
        'progressColor': Colors.deepOrange,
      },
      {
        'title': 'Travel Vocabulary',
        'subtitle': 'Seyahat için gerekli kelimeler',
        'category': 'Travel',
        'wordCount': 90,
        'level': 'Beginner',
        'progressPercentage': 80,
        'progressColor': Colors.pink,
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      itemCount: readyLists.length,
      itemBuilder: (context, index) {
        final item = readyLists[index];
        return WordListItem(
          title: item['title']!,
          subtitle: item['subtitle']!,
          category: item['category']!,
          wordCount: item['wordCount']!,
          level: item['level']!,
          progressPercentage: item['progressPercentage']!,
          progressColor: item['progressColor']!,
          onTap: () {
            // Detail sayfasına git
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

  // Benim Listelerimi Gösteren Widget
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
          title: item['title']!,
          subtitle: item['subtitle']!,
          category: item['category']!,
          wordCount: item['wordCount']!,
          level: item['level']!,
          progressPercentage: item['progressPercentage']!,
          progressColor: item['progressColor']!,
          onTap: () {
            // Detail sayfasına git
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
