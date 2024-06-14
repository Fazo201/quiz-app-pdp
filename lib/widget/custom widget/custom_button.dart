import 'package:flutter/material.dart';
import 'package:quiz_app/core/style/app_text_style.dart';

class CustomQuizButton extends StatelessWidget {
  final String alpha;
  final String text;
  final VoidCallback onPressed;

  const CustomQuizButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.alpha,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.only(left: 24),
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: "$alpha. ",
              style: const AppTextStyle().profileTitle,
              children: <TextSpan>[
                TextSpan(
                  text: text,
                  style: const AppTextStyle().profileTitle?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
