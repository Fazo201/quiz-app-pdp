import 'package:flutter/material.dart';
import 'package:quiz_app/core/route/app_route_path.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_images.dart';
import 'package:quiz_app/core/style/app_text_style.dart';
import 'package:quiz_app/widget/custom%20widget/custom_level_category.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {

  List<CustomLevelCategory> list = [
    CustomLevelCategory(image: AppImages.levelFlutterLogo,text: "Flutter", goLocation: "${AppRoutePath.level}/${AppRoutePath.levelCategory}"),
    CustomLevelCategory(image: AppImages.levelPythonLogo,text: "Python",),
    CustomLevelCategory(image: AppImages.levelFrontendLogo,text: "Frontend",),
    CustomLevelCategory(image: AppImages.levelJavaLogo,text: "Java",),
    CustomLevelCategory(image: AppImages.levelCPlusLogo,text: "C++",),
    CustomLevelCategory(image: AppImages.levelCSharpLogo,text: "C#",),
    CustomLevelCategory(image: AppImages.levelAndroidLogo,text: "Android",),
    CustomLevelCategory(image: AppImages.levelIOSLogo,text: "IOS",),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 112,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            width: double.infinity,
            height: 46,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Level",style: const AppTextStyle().titleLarge,),
                AppImages.personLogo,
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        itemBuilder: (context,index){
          return list[index];
        },
        itemCount: list.length,
      ),
    );
  }
}
