import 'package:cerebria/constants/module_item.dart';
import 'package:cerebria/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/page_top_item.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode: false);

    return Scaffold(
      backgroundColor: colors.module.pageBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 70),
          // back button and page name
          PageTopItem(colors: colors, pageName: "Module"),
          const SizedBox(height: 16),
          // module grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 160 / 120,
              ),
              itemCount: modules.length,
              itemBuilder: (context, index) {
                final item = modules[index];
                return Container(
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Image.asset(
                          item.iconPath,
                          width: 35,
                          height: 35,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.name,
                          style: TextStyle(
                            color: colors.module.moduleContainerTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
