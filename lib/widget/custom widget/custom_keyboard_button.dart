import 'package:flutter/material.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_text_style.dart';

class CustomKeyboardButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  const CustomKeyboardButton({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return text != null && icon == null
        ? MaterialButton(
            onPressed: onPressed,
            height: 53,
            minWidth: 93.67,
            color: AppColors.lD9D9D9,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            child: Text(
              text!,
              style: const AppTextStyle().richText?.copyWith(
                    fontSize: 24,
                    color: AppColors.l264653,
                    fontFamily: "Roboto",
                  ),
            ),
          )
        : MaterialButton(
            onPressed: onPressed,
            height: 53,
            minWidth: 93.67,
            color: AppColors.lD9D9D9,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          );
  }
}
