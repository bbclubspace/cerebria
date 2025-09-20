import 'package:cerebria/core/constants/module_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cerebria/core/themes/app_colors.dart';

class CreateListDialog {
  static Future<Map<String, dynamic>?> show(BuildContext context) {
    return showDialog<Map<String, dynamic>>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const CreateListDialogWidget();
      },
    );
  }
}

class CreateListDialogWidget extends StatefulWidget {
  const CreateListDialogWidget({Key? key}) : super(key: key);

  @override
  State<CreateListDialogWidget> createState() => _CreateListDialogWidgetState();
}

class _CreateListDialogWidgetState extends State<CreateListDialogWidget> {
  final TextEditingController _listNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _wordsController = TextEditingController();

  String _selectedLevel = 'Beginner';
  final List<String> _levels = ['Beginner', 'Intermediate', 'Advanced'];

  @override
  void dispose() {
    _listNameController.dispose();
    _descriptionController.dispose();
    _wordsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: colors.vocabularyList.dialogBgColor,
      child: Container(
        padding: EdgeInsets.all(24.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dialog başlığı
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create New List',
                    style: TextStyle(
                      fontSize: 20.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // Liste Adı
              Text(
                'List Name',
                style: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: _listNameController,
                decoration: InputDecoration(
                  hintText: 'Enter list name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Açıklama
              Text(
                'Description',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: _descriptionController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Enter list description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Level Seçimi
              Text(
                'Level',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedLevel,
                    isExpanded: true,
                    items: _levels.map((String level) {
                      return DropdownMenuItem<String>(
                        value: level,
                        child: Text(level),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLevel = newValue!;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Kelimeler
              Text(
                'Words (one word per line)',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: _wordsController,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText:
                      'Enter words, one per line:\nExample:\napple\nbanana\norange',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Butonlar
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text('Cancel', style: TextStyle(fontSize: 16.sp)),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _createList,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        'Create List',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createList() {
    // Validasyon kontrolü
    if (_listNameController.text.trim().isEmpty) {
      _showErrorSnackBar('Please enter a list name');
      return;
    }

    if (_descriptionController.text.trim().isEmpty) {
      _showErrorSnackBar('Please enter a description');
      return;
    }

    if (_wordsController.text.trim().isEmpty) {
      _showErrorSnackBar('Please enter at least one word');
      return;
    }

    // Kelimeleri satır satır ayır ve boş satırları temizle
    final words = _wordsController.text
        .split('\n')
        .map((word) => word.trim())
        .where((word) => word.isNotEmpty)
        .toList();

    if (words.isEmpty) {
      _showErrorSnackBar('Please enter at least one valid word');
      return;
    }

    // Liste verisini oluştur
    final newList = {
      'title': _listNameController.text.trim(),
      'subtitle': _descriptionController.text.trim(),
      'category': 'Custom',
      'wordCount': words.length,
      'level': _selectedLevel,
      'progressPercentage': 0,
      'progressColor': Colors.purple,
      'words': words,
      'isCustomList': true,
    };

    // Başarılı mesaj göster
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('List "${newList['title']}" created successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Dialog'u kapat ve listeyi geri döndür
    Navigator.pop(context, newList);
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
