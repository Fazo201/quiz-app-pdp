import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import '../../core/style/app_text_style.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final String navigateText;
  final void Function()? onTap;
  const CustomRichText({super.key, required this.text, required this.navigateText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$text ",
        style: const AppTextStyle().richText,
        children: [
          TextSpan(
            text: navigateText,
            style: const AppTextStyle().richText?.copyWith(
                  color: AppColors.l00B533,
                ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
