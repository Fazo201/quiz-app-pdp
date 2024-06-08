import 'package:flutter/material.dart';

class QuizGameResultScreen extends StatefulWidget {
  const QuizGameResultScreen({super.key});

  @override
  State<QuizGameResultScreen> createState() => _QuizGameResultScreenState();
}

class _QuizGameResultScreenState extends State<QuizGameResultScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Quiz Game Result Screen screen"),
      ),
    );
  }
}
