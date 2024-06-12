import 'package:flutter/material.dart';
import 'package:quiz_app/core/route/go_route_system.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/Difficulity%20selection/Home%20category/Quiz/quiz_game_screen.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/Difficulity%20selection/Home%20category/selected_category_screen_from_home_screen.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/Difficulity%20selection/difficulty_selection_screen.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/home_screen.dart';
import 'package:quiz_app/widget/screen/Main/main_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizGameScreen(),
    );
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routerConfig: GoRouteSystem.router,
    // );
  }
}