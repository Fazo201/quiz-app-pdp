import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/route/app_route_name.dart';
import 'package:quiz_app/widget/screen/Auth/Sign%20In/sign_in_screen.dart';
import 'package:quiz_app/widget/screen/Auth/Sign%20Up/sign_up_screen.dart';
import 'package:quiz_app/widget/screen/Auth/Sign%20Up/verification_code_screen.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/Home%20category/Difficulity%20selection/Quiz/quiz_game_result_screen.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/Home%20category/Difficulity%20selection/Quiz/quiz_game_screen.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/Home%20category/Difficulity%20selection/difficulty_selection_screen.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/Home%20category/selected_category_screen_from_home_screen.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/home_screen.dart';
import 'package:quiz_app/widget/screen/Main/Level%20root/level_screen.dart';
import 'package:quiz_app/widget/screen/Main/Level%20root/selected_category_screen_from_level_screen.dart';
import 'package:quiz_app/widget/screen/Main/Profile/profile_screen.dart';
import 'package:quiz_app/widget/screen/Main/main_screen.dart';
import 'package:quiz_app/widget/screen/Splash/splash_screen.dart';

final class GoRouteSystem {

  static GoRouter router = GoRouter(

    /// Initial Location
    initialLocation: AppRouteName.signIn,

    routes: [

      /// Splash screen
      GoRoute(
        path: AppRouteName.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      /// Auth
      GoRoute(
        path: AppRouteName.signIn,
        builder: (context, state) => const SignInScreen(),
        routes: [
          GoRoute(
            path: AppRouteName.signUp,
            builder: (context, state) => const SignUpScreen(),
            routes: [
              GoRoute(
                path: AppRouteName.verificationCode,
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
            path: AppRouteName.home,
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                path: AppRouteName.homeCategory,
                builder: (context, state) =>
                    const SelectedCategoryScreenFromHomeScreen(),
                routes: [
                  GoRoute(
                    path: AppRouteName.difficultySelection,
                    builder: (context, state) =>
                        const DifficultySelectionScreen(),
                    routes: [
                      GoRoute(
                        path: AppRouteName.quizGame,
                        builder: (context, state) => const QuizGameScreen(),
                        routes: [
                          GoRoute(
                            path: AppRouteName.quizGameResult,
                            builder: (context, state) =>
                                const QuizGameResultScreen(),
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
            path: AppRouteName.level,
            builder: (context, state) => const LevelScreen(),
            routes: [
              GoRoute(
                path: AppRouteName.levelCategory,
                builder: (context, state) =>
                    const SelectedCategoryScreenFromLevelScreen(),
              ),
            ],
          ),
          GoRoute(
            path: AppRouteName.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),

    ],
  );
}
