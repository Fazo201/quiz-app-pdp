import 'package:flutter/material.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_text_style.dart';

class CustomTextField extends StatelessWidget {

  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final bool obscureText;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.keyBoardType,
      required this.obscureText,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
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
            Radius.circular(10),
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
