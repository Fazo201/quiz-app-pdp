import 'package:flutter/material.dart';
import 'package:quiz_app/core/route/app_route_name.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_images.dart';
import 'package:quiz_app/core/style/app_text_style.dart';
import 'package:quiz_app/widget/custom%20widget/custom_home_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<CustomHomeCategory> list = [
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeFlutterLogo,text: "Flutter", goLocation: "${AppRouteName.home}/${AppRouteName.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homePythonLogo,text: "Phyton", goLocation: "${AppRouteName.home}/${AppRouteName.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeFrontendLogo,text: "Frontend", goLocation: "${AppRouteName.home}/${AppRouteName.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeJavaLogo,text: "Java", goLocation: "${AppRouteName.home}/${AppRouteName.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeCPlusLogo,text: "C++", goLocation: "${AppRouteName.home}/${AppRouteName.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeCSharpLogo,text: "C#", goLocation: "${AppRouteName.home}/${AppRouteName.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeAndroidLogo,text: "Android", goLocation: "${AppRouteName.home}/${AppRouteName.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeIOSLogo,text: "IOS", goLocation: "${AppRouteName.home}/${AppRouteName.difficultySelection}"),
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
                Text("Hello  null",style: const AppTextStyle().titleLarge,),
                AppImages.personLogo,
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 30.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return list[index];
          },
          itemCount: list.length,
        ),
      ),
    );
  }

}
