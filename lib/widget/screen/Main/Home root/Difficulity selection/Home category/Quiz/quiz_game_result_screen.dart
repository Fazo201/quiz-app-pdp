import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/route/app_route_path.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                      height: 199,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: AppColors.l00B533,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 80),
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            color: AppColors.white30,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                color: AppColors.white50,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        textAlign: TextAlign.center,
                                        "Your\nResult",
                                        style: const AppTextStyle()
                                            .labelHide
                                            ?.copyWith(
                                              color: AppColors.l00B533,
                                              fontSize: 10,
                                            ),
                                      ),
                                      Text(
                                        "15",
                                        style: const AppTextStyle()
                                            .profileTitle
                                            ?.copyWith(
                                              color: AppColors.l00B533,
                                              fontSize: 18,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 135),
                    child: Container(
                      height: 120,
                      width: 275,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.circle,
                                  color: Colors.green, size: 16),
                              const SizedBox(width: 8),
                              Text(
                                "3 correct answers",
                                style:
                                    const AppTextStyle().titleSmall?.copyWith(
                                          color: Colors.black,
                                        ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.circle,
                                  color: Colors.red, size: 16),
                              const SizedBox(width: 8),
                              Text(
                                "7 incorrect answers",
                                style:
                                    const AppTextStyle().titleSmall?.copyWith(
                                          color: Colors.black,
                                        ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  color: AppColors.l00B533,
                ),
              ),
              child: MaterialButton(
                onPressed: () {
                  context.go("${AppRoutePath.home}/${AppRoutePath.difficultySelection}/${AppRoutePath.homeCategory}");
                },
                height: 54,
                minWidth: double.infinity,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide.none,
                ),
                child: Text(
                  "Restart the test",
                  style: const AppTextStyle().richText?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  color: AppColors.l00B533,
                ),
              ),
              child: MaterialButton(
                onPressed: () {
                  context.go(AppRoutePath.home);
                },
                height: 54,
                minWidth: double.infinity,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide.none,
                ),
                child: Text(
                  "Return to main menu",
                  style: const AppTextStyle().richText?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
