import 'package:flutter/material.dart';
import 'package:quiz_app/core/style/app_images.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: AppImages.bottomHomeLogo,
            activeIcon: AppImages.bottomHomeSelectLogo,
            label: "",
          ),
          BottomNavigationBarItem(
            icon: AppImages.bottomLevelLogo,
            activeIcon: AppImages.bottomLevelSelectLogo,
            label: "",
          ),
          BottomNavigationBarItem(
            icon: AppImages.bottomProfileLogo,
            activeIcon: AppImages.bottomProfileSelectLogo,
            label: "",
          ),
        ],
      );
  }
}