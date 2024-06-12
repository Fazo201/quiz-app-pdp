import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/route/app_route_path.dart';
import 'package:quiz_app/widget/custom%20widget/custom_timer_card.dart';

import '../../../../../../../core/style/app_colors.dart';
import '../../../../../../../core/style/app_images.dart';
import '../../../../../../../core/style/app_text_style.dart';

class QuizGameScreen extends StatefulWidget {
  const QuizGameScreen({super.key});

  @override
  State<QuizGameScreen> createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  late Timer _timer;
  int _start = 15;
  int indexTestList = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void reStartTimer() {
    _start = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
    startTimer();
  }

  var questionsAndAnswers = [
  {
    "question": "What is Flutter?",
    "answers": [
      "UI toolkit by Google", // Correct answer
      "Operating system",
      "Database system"
    ]
  },
  {
    "question": "Who developed Flutter?",
    "answers": [
      "Developed by Google", // Correct answer
      "Developed by Facebook",
      "Developed by Microsoft"
    ]
  },
  {
    "question": "What language does Flutter use?",
    "answers": [
      "Dart programming language", // Correct answer
      "JavaScript",
      "Python"
    ]
  },
  {
    "question": "Difference between Stateful and Stateless widgets?",
    "answers": [
      "Stateful: dynamic, Stateless: static", // Correct answer
      "Both are static",
      "Both are dynamic"
    ]
  },
  {
    "question": "How to define a custom widget?",
    "answers": [
      "Extend Stateless or StatefulWidget", // Correct answer
      "Use main.dart file",
      "Define in XML"
    ]
  },
  {
    "question": "Purpose of `pubspec.yaml` file?",
    "answers": [
      "Manage dependencies and assets", // Correct answer
      "Configure IDE settings",
      "Define API endpoints"
    ]
  },
  {
    "question": "How to handle state in Flutter?",
    "answers": [
      "setState, Provider, Bloc", // Correct answer
      "Use only setState",
      "Use global variables"
    ]
  },
  {
    "question": "Main components of Flutter?",
    "answers": [
      "Dart, engine, widgets, library", // Correct answer
      "Java, XML, SQLite",
      "HTML, CSS, JavaScript"
    ]
  },
  {
    "question": "How to navigate between screens?",
    "answers": [
      "Navigator.push and pop", // Correct answer
      "Route.push and Route.pop",
      "Screen.push and Screen.pop"
    ]
  },
  {
    "question": "Use of `build` method?",
    "answers": [
      "Describe widget's UI", // Correct answer
      "Handle user input",
      "Manage app lifecycle"
    ]
  }
];


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
            const SizedBox(height: 60),
            CustomCardWithTimer(
                text: questionsAndAnswers[indexTestList].values.first.toString(),
                time: "$_start"),
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
                    if(indexTestList<9){
                      setState(() {
                        indexTestList++;
                        startTimer();
                      });
                    }else{
                      context.go("${AppRoutePath.home}/${AppRoutePath.difficultySelection}/${AppRoutePath.homeCategory}/${AppRoutePath.quizGame}/${AppRoutePath.quizGameResult}");
                    }
                },
                // color: AppColors.l00B533,
                height: 54,
                minWidth: double.infinity,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide.none,
                ),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'A. ',
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                              text: questionsAndAnswers[indexTestList].values.lastWhere((e)=>e is String).toString(),
                              style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    color: AppColors.l00B533,
                  )),
              child: MaterialButton(
                onPressed: () {
                    if(indexTestList<9){
                      setState(() {
                        indexTestList++;
                        startTimer();
                      });
                    }else{
                      context.go("${AppRoutePath.home}/${AppRoutePath.difficultySelection}/${AppRoutePath.homeCategory}/${AppRoutePath.quizGame}/${AppRoutePath.quizGameResult}");
                    }
                },
                height: 54,
                minWidth: double.infinity,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide.none,
                ),
                child: Row(
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'B. ',
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                              text: 'Lorem Ipsum',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    color: AppColors.l00B533,
                  )),
              child: MaterialButton(
                onPressed: () {
                    if(indexTestList<9){
                      setState(() {
                        indexTestList++;
                        startTimer();
                      });
                    }else{
                      context.go("${AppRoutePath.home}/${AppRoutePath.difficultySelection}/${AppRoutePath.homeCategory}/${AppRoutePath.quizGame}/${AppRoutePath.quizGameResult}");
                    }
                },
                height: 54,
                minWidth: double.infinity,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide.none,
                ),
                child: Row(
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'C. ',
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                              text: 'Phasellus auctor',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    )
                  ],
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
