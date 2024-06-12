import 'package:flutter/material.dart';
import 'package:quiz_app/core/route/go_route_system.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/Difficulity%20selection/Home%20category/Quiz/quiz_game_result_screen.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/Difficulity%20selection/Home%20category/Quiz/quiz_game_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizGameScreen(),
    );
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routerConfig: GoRouteSystem.router,
    // );
  }
}