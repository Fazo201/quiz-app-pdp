import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/route/app_route_name.dart';
import 'package:quiz_app/core/route/app_route_path.dart';
import 'package:quiz_app/widget/custom%20widget/custom_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  void nextScreen(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        context.go(AppRoutePath.home);
        break;
      case 1:
        context.go(AppRoutePath.level);
        break;
      case 2:
        context.go(AppRoutePath.profile);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: widget.child,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: nextScreen,
      ),
    );
  }
}

