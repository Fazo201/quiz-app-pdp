import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_images.dart';
import 'package:quiz_app/core/style/app_text_style.dart';
import 'package:quiz_app/widget/custom%20widget/custom_timer_card.dart';
import '../../../../../../../core/route/app_route_path.dart';
import '../../../../../../../core/style/app_colors.dart';
import '../../../../../../custom widget/custom_button.dart';

class QuizGameScreen extends StatefulWidget {
  const QuizGameScreen({super.key});

  @override
  State<QuizGameScreen> createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  late Timer _timer;
  int start = 15;

  @override
  void initState() {
    super.initState();
    pickThreeQuestions();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        setState(() {
          pickThreeQuestions();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void resetTimer() {
    _timer.cancel();
    setState(() {
      start = 15;
    });
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  final CollectionReference myItems = FirebaseFirestore.instance.collection('Quiz collection');

  List<DocumentSnapshot>? selectedQuestions;

  Future<void> pickThreeQuestions() async {
    QuerySnapshot querySnapshot = await myItems.get();
    List<DocumentSnapshot> allQuestions = querySnapshot.docs;
    allQuestions.shuffle(Random());
    setState(() {
      selectedQuestions = allQuestions.take(1).toList();
      resetTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (selectedQuestions == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    final questionData = selectedQuestions![0].data() as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Lorem impsum...",
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
          children: [
            const SizedBox(height: 60),

            /// Top container
            CustomCardWithTimer(
              text: questionData['question'] ?? 'No question available',
              time: "$start",
            ),
            const Spacer(),
            Container(
              height: 54,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: AppColors.l00B533,
                ),
              ),
              child: CustomQuizButton(
                alpha: "A",
                text: questionData['firstChoice'] ?? 'No choice available',
                onPressed: () {
                  pickThreeQuestions();
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 54,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: AppColors.l00B533,
                ),
              ),
              child: CustomQuizButton(
                alpha: "B",
                text: questionData['secondChoice'] ?? 'No choice available',
                onPressed: () {
                  pickThreeQuestions();
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 54,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: AppColors.l00B533,
                ),
              ),
              child: CustomQuizButton(
                alpha: "C",
                text: questionData['correctChoice'] ?? 'No choice available',
                onPressed: () {
                  pickThreeQuestions();
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
