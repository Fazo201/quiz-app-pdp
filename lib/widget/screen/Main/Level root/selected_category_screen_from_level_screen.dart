import 'package:flutter/material.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_images.dart';
import '../../../../core/style/app_text_style.dart';
import '../../../custom widget/custom_level_category.dart';

class SelectedCategoryScreenFromLevelScreen extends StatefulWidget {
  const SelectedCategoryScreenFromLevelScreen({super.key});

  @override
  State<SelectedCategoryScreenFromLevelScreen> createState() =>
      _SelectedCategoryScreenFromLevelScreenState();
}

class _SelectedCategoryScreenFromLevelScreenState
    extends State<SelectedCategoryScreenFromLevelScreen> {
  List<CustomLevelCategory> list = [
    CustomLevelCategory(image: AppImages.personLogo, text: "You"),
    // CustomLevelCategory(image: AppImages.levelPythonLogo,text: "Python",),
    // CustomLevelCategory(image: AppImages.levelFrontendLogo,text: "Frontend",),
    // CustomLevelCategory(image: AppImages.levelJavaLogo,text: "Java",),
    // CustomLevelCategory(image: AppImages.levelCPlusLogo,text: "C++",),
    // CustomLevelCategory(image: AppImages.levelCSharpLogo,text: "C#",),
    // CustomLevelCategory(image: AppImages.levelAndroidLogo,text: "Android",),
    // CustomLevelCategory(image: AppImages.levelIOSLogo,text: "IOS",),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Back",
              style: const AppTextStyle().richText?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              "Flutter",
              style: const AppTextStyle().richText?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(flex: 2),
            Container(
              height: 46,
              width: 46,
              decoration: const BoxDecoration(
                color: AppColors.lF5F5F5,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppImages.appBarFlutterLogo,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return list[index];
          },
          itemCount: list.length,
        ),
      ),
    );
  }
}
