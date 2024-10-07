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
import '../../../../../../custom widget/custom_button.dart';

class QuizGameScreen extends StatefulWidget {
  final int difficultyTime;
  const QuizGameScreen({super.key, required this.difficultyTime});

  @override
  State<QuizGameScreen> createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  late Timer _timer;
  late int start;
  int index = 0;
  int correctAnswer = 0;
  Color colorA = AppColors.l00B533;
  Color colorB = AppColors.l00B533;
  Color colorC = AppColors.l00B533;

  List<Map<String, String>> choices = [];

  @override
  void initState() {
    super.initState();
    start = widget.difficultyTime;
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
    if (index == 10) {
      context.pushReplacement(
        "${AppRoutePath.home}/${AppRoutePath.difficultySelection}/${AppRoutePath.homeCategory}/${AppRoutePath.quizGame}/${AppRoutePath.quizGameResult}",
        extra: correctAnswer,
      );
    } else {
      _timer.cancel();
      setState(() {
        index++;
        start = widget.difficultyTime;
        resetColors();
      });
      startTimer();
    }
  }

  void resetColors() {
    colorA = AppColors.l00B533;
    colorB = AppColors.l00B533;
    colorC = AppColors.l00B533;
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
      shuffleChoices(selectedQuestions![0].data() as Map<String, dynamic>);
      resetTimer();
    });
  }

  void shuffleChoices(Map<String, dynamic> questionData) {
    choices = [
      {'alpha': 'A', 'text': questionData['firstChoice'], 'isCorrect': 'false'},
      {'alpha': 'B', 'text': questionData['secondChoice'], 'isCorrect': 'false'},
      {'alpha': 'C', 'text': questionData['correctChoice'], 'isCorrect': 'true'},
    ];
    choices.shuffle(Random());
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
              text: "$index: ${questionData['question'] ?? 'No question available'}",
              time: "$start",
            ),
            const Spacer(),
            ...choices.map((choice) {
              Color borderColor;
              switch (choice['alpha']) {
                case 'A':
                  borderColor = colorA;
                  break;
                case 'B':
                  borderColor = colorB;
                  break;
                case 'C':
                  borderColor = colorC;
                  break;
                default:
                  borderColor = AppColors.l00B533;
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: borderColor,
                    ),
                  ),
                  child: CustomQuizButton(
                    alpha: choice['alpha']!,
                    text: choice['text']!,
                    onPressed: () {
                      setState(() {
                        if (choice['isCorrect'] == 'true') {
                          correctAnswer++;
                          if (choice['alpha'] == 'A') {
                            colorA = AppColors.l00B533;
                          } else if (choice['alpha'] == 'B') {
                            colorB = AppColors.l00B533;
                          } else {
                            colorC = AppColors.l00B533;
                          }
                        } else {
                          if (choice['alpha'] == 'A') {
                            colorA = AppColors.lFF0000;
                          } else if (choice['alpha'] == 'B') {
                            colorB = AppColors.lFF0000;
                          } else {
                            colorC = AppColors.lFF0000;
                          }
                        }
                        pickThreeQuestions();
                      });
                    },
                  ),
                ),
              );
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
