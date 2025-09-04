import 'package:cerebria/constants/module_item.dart';
import 'package:cerebria/themes/app_colors.dart';
import 'package:cerebria/widget/button/app_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Row(
            children: [
              const SizedBox(width: 16),
              AppBackButton(iconPath: "assets/auth-icon/back.png", colors: colors),
              const SizedBox(width: 100),
               Text(
                "Module",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400,color: colors.module.titleTextColor),
              ),
            ],
          ),
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
                          style:  TextStyle(
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
