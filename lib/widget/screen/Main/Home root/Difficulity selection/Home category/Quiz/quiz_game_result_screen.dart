import 'package:flutter/material.dart';

import '../../../../../../../core/style/app_colors.dart';
import '../../../../../../../core/style/app_images.dart';
import '../../../../../../../core/style/app_text_style.dart';

class QuizGameResultScreen extends StatefulWidget {
  const QuizGameResultScreen({super.key});

  @override
  State<QuizGameResultScreen> createState() => _QuizGameResultScreenState();
}

class _QuizGameResultScreenState extends State<QuizGameResultScreen> {
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
            Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      height: 161,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.l00B533,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              "1. Lorem ipsum dolor sit amet, consectetu adipiscing elit. Quisque sit amet velit malesuada, scelerisque diam non, blandit neque.",
                              style: const AppTextStyle().richText?.copyWith(
                                color: AppColors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                        color: AppColors.l00B533,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.l00B533,
                          width: 2,
                        )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.l00B533,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.white,
                            width: 3,
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
