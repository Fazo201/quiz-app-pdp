import 'package:flutter/material.dart';
import 'package:quiz_app/widget/custom%20widget/custom_bottom_navigation_bar.dart';
import 'package:quiz_app/widget/screen/Main/Home%20root/home_screen.dart';
import 'package:quiz_app/widget/screen/Main/Level%20root/level_screen.dart';
import 'package:quiz_app/widget/screen/Main/Profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();

  final List<Widget> screens = const <Widget>[
    HomeScreen(),
    LevelScreen(),
    ProfileScreen(),
  ];

  void nextScreen(int index) {
    currentIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOutExpo,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        onPageChanged: nextScreen,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex, 
        onTap: nextScreen,
      ),
    );
  }
}
