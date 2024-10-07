import 'package:flutter/material.dart';
import 'package:quiz_app/core/style/app_colors.dart';
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
    return ClipPath(
      clipper: MyCustomClipper(),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedFontSize: 20,
        unselectedFontSize: 20,
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
        backgroundColor: AppColors.white,
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 20);
    path.quadraticBezierTo(size.width * 0.5, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
