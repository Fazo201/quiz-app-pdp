import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_images.dart';
import 'package:quiz_app/core/style/app_text_style.dart';

import '../../../../../core/route/app_route_path.dart';

class DifficultySelectionScreen extends StatefulWidget {
  const DifficultySelectionScreen({super.key});

  @override
  State<DifficultySelectionScreen> createState() =>
      _DifficultySelectionScreenState();
}

class _DifficultySelectionScreenState extends State<DifficultySelectionScreen> {
  int difficultyTime = 0;
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
                "Lorem ipsum dolor sit amet c...",
                style: const AppTextStyle().richText,
              ),
              const Spacer(),
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
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: AppColors.l00B533,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        textAlign: TextAlign.center,
                        "Welcome to I.Q",
                        style: const AppTextStyle().profileTitle?.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        textAlign: TextAlign.center,
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet velit malesuada, scelerisque diam non, blandit neque.",
                        style: const AppTextStyle().richText?.copyWith(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Choose one of the\nsteps...",
                textAlign: TextAlign.center,
                style: const AppTextStyle().titleLarge?.copyWith(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        difficultyTime = 15;
                        context.go("${AppRoutePath.home}/${AppRoutePath.difficultySelection}/${AppRoutePath.homeCategory}", extra: difficultyTime);
                      },
                      color: AppColors.l00B533,
                      height: 60,
                      minWidth: double.infinity,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide.none,
                      ),
                      child: Text(
                        "Easy",
                        style: const AppTextStyle().titleMedium?.copyWith(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        difficultyTime = 10;
                        context.go("${AppRoutePath.home}/${AppRoutePath.difficultySelection}/${AppRoutePath.homeCategory}", extra: difficultyTime);                      },
                      color: AppColors.l00B533,
                      height: 60,
                      minWidth: double.infinity,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide.none,
                      ),
                      child: Text(
                        "Medium",
                        style: const AppTextStyle().titleMedium?.copyWith(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        difficultyTime = 5;
                        context.go("${AppRoutePath.home}/${AppRoutePath.difficultySelection}/${AppRoutePath.homeCategory}", extra: difficultyTime);
                      },
                      color: AppColors.l00B533,
                      height: 60,
                      minWidth: double.infinity,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide.none,
                      ),
                      child: Text(
                        "Hard",
                        style: const AppTextStyle().titleMedium?.copyWith(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
  }
}
