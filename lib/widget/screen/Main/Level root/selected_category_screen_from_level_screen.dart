import 'package:flutter/material.dart';

class SelectedCategoryScreenFromLevelScreen extends StatefulWidget {
  const SelectedCategoryScreenFromLevelScreen({super.key});

  @override
  State<SelectedCategoryScreenFromLevelScreen> createState() => _SelectedCategoryScreenFromLevelScreenState();
}

class _SelectedCategoryScreenFromLevelScreenState extends State<SelectedCategoryScreenFromLevelScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Selected Category Screen From Level Screen screen"),
      ),
    );
  }
}
