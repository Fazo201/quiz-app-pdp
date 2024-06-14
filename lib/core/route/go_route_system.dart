import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/route/app_route_name.dart';
import 'package:quiz_app/core/route/app_route_path.dart';
import 'package:quiz_app/widget/screen/Auth/Sign%20In/sign_in_screen.dart';
import 'package:quiz_app/widget/screen/Auth/Sign%20Up/sign_up_screen.dart';
import 'package:quiz_app/widget/screen/Auth/Sign%20Up/verification_code_screen.dart';
import 'package:quiz_app/widget/screen/Auth/auth_gate.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/home_screen.dart';
import 'package:quiz_app/widget/screen/Main/Level%20root/level_screen.dart';
import 'package:quiz_app/widget/screen/Main/Level%20root/selected_category_screen_from_level_screen.dart';
import 'package:quiz_app/widget/screen/Main/Profile/profile_screen.dart';
import 'package:quiz_app/widget/screen/Main/main_screen.dart';
import 'package:quiz_app/widget/screen/Splash/splash_screen.dart';

import '../../widget/screen/Main/Home root/Difficulity selection/Home category/Quiz/quiz_game_result_screen.dart';
import '../../widget/screen/Main/Home root/Difficulity selection/Home category/Quiz/quiz_game_screen.dart';
import '../../widget/screen/Main/Home root/Difficulity selection/Home category/selected_category_screen_from_home_screen.dart';
import '../../widget/screen/Main/Home root/Difficulity selection/difficulty_selection_screen.dart';

final class GoRouteSystem {
  static GoRouter router = GoRouter(
    /// Initial Location
    initialLocation: AppRoutePath.splash,

    routes: [
      /// Splash screen
      GoRoute(
        path: AppRoutePath.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      /// Auth Gate
      GoRoute(
        path: AppRoutePath.authGate,
        builder: (context, state) => const AuthGate(),
      ),

      /// Auth
      GoRoute(
        path: AppRoutePath.signIn,
        builder: (context, state) => const SignInScreen(),
        routes: [
          GoRoute(
            path: AppRoutePath.signUp,
            builder: (context, state) => const SignUpScreen(),
            routes: [
              GoRoute(
                name: AppRouteName.verificationCode,
                path: AppRoutePath.verificationCode,
                builder: (context, state) => const VerificationCodeScreen(),
              ),
            ],
          ),
        ],
      ),

      /// Main
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: AppRoutePath.home,
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                path: AppRoutePath.difficultySelection,
                builder: (context, state) => const DifficultySelectionScreen(),
                routes: [
                  GoRoute(
                    path: AppRoutePath.homeCategory,
                    builder: (context, state) {
                      final int difficultyTime = state.extra as int;
                      return SelectedCategoryScreenFromHomeScreen(difficultyTime: difficultyTime);
                    },
                    routes: [
                      GoRoute(
                        path: AppRoutePath.quizGame,
                        builder: (context, state) {
                          final int difficultyTime = state.extra as int;
                          return QuizGameScreen(difficultyTime: difficultyTime);
                        },
                        routes: [
                          GoRoute(
                            path: AppRoutePath.quizGameResult,
                            builder: (context, state) {
                              final int correctAnswer = state.extra as int;
                              return QuizGameResultScreen(correctAnswer: correctAnswer);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: AppRoutePath.level,
            builder: (context, state) => const LevelScreen(),
            routes: [
              GoRoute(
                path: AppRoutePath.levelCategory,
                builder: (context, state) =>
                    const SelectedCategoryScreenFromLevelScreen(),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutePath.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
