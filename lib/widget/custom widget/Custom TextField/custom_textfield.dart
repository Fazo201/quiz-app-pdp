import 'package:flutter/material.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyBoardType;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyBoardType,
    required this.obscureText,
    required this.labelText,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        // enabled: false,
        labelStyle: const AppTextStyle().bodyMedium?.copyWith(
              color: AppColors.l121212,
            ),
        hintStyle: const AppTextStyle().hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(11),
          ),
          borderSide: BorderSide(
            color: AppColors.lD9D9D9,
            width: 1,
          ),
        ),
      ),
    );
  }
}
