import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/route/app_route_path.dart';
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
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    firebaseAuth = FirebaseAuth.instance;
    super.initState();
  }

  List<CustomHomeCategory> list = [
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeFlutterLogo,text: "Flutter", goLocation: "${AppRoutePath.home}/${AppRoutePath.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homePythonLogo,text: "Python", goLocation: "${AppRoutePath.home}/${AppRoutePath.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeFrontendLogo,text: "Frontend", goLocation: "${AppRoutePath.home}/${AppRoutePath.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeJavaLogo,text: "Java", goLocation: "${AppRoutePath.home}/${AppRoutePath.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeCPlusLogo,text: "C++", goLocation: "${AppRoutePath.home}/${AppRoutePath.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeCSharpLogo,text: "C#", goLocation: "${AppRoutePath.home}/${AppRoutePath.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeAndroidLogo,text: "Android", goLocation: "${AppRoutePath.home}/${AppRoutePath.difficultySelection}"),
    CustomHomeCategory(color: AppColors.lF5F5F5,image: AppImages.homeIOSLogo,text: "IOS", goLocation: "${AppRoutePath.home}/${AppRoutePath.difficultySelection}"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
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
                Text("Hello ${firebaseAuth.currentUser?.displayName?.split('/')[0]}",style: const AppTextStyle().titleLarge,),
                AppImages.personLogo,
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(right: 30, left: 30, bottom: 80),
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
    );
  }

}
