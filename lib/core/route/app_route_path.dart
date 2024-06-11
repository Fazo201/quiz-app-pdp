import 'package:flutter/material.dart';

@immutable
final class AppRoutePath{
  const AppRoutePath._();

  static const String splash = "/";
  static const String authGate = "/auth_gate";
  static const String signIn = "/sign_in_screen";
  static const String signUp = "sign_up_screen";
  static const String verificationCode = "verification_code_screen";
  static const String main = "/main_screen";
  static const String home = "/home";
  static const String homeCategory = "selected_category_screen_from_home_screen";
  static const String difficultySelection = "difficulty_selection_screen";
  static const String quizGame = "quiz_game_screen";
  static const String quizGameResult = "quiz_game_result_screen";
  static const String level = "/level_screen";
  static const String levelCategory = "selected_category_screen_from_level_screen";
  static const String profile = "/profile_screen";
}