import 'package:flutter/material.dart';

class SelectedCategoryScreenFromHomeScreen extends StatefulWidget {
  const SelectedCategoryScreenFromHomeScreen({super.key});

  @override
  State<SelectedCategoryScreenFromHomeScreen> createState() => _SelectedCategoryScreenFromHomeScreenState();
}

class _SelectedCategoryScreenFromHomeScreenState extends State<SelectedCategoryScreenFromHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Selected Category Screen From Home Screen screen"),
      ),
    );
  }
}
