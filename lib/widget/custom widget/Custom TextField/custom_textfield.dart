import 'package:flutter/material.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final TextInputAction textInputAction;
  final bool? obscureText;
  final IconButton? suffixIcon;
  final void Function()? onTap;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyBoardType,
    this.obscureText,
    required this.labelText,
    required this.textInputAction,
    this.suffixIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return suffixIcon == null
        ? TextField(
            controller: controller,
            keyboardType: keyBoardType,
            obscureText: obscureText ?? false,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              /// error: ,
              errorMaxLines: 2,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.lFF0000,
                ),
              ),
              labelStyle: const AppTextStyle().labelHide,
              floatingLabelStyle:
                  const AppTextStyle().subText?.copyWith(fontSize: 19),
              label: Text(labelText),
              hintText: hintText,
              hintStyle: const AppTextStyle().hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.lD9D9D9,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.lD9D9D9,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.l00B533,
                  width: 1,
                ),
              ),
            ),
          )

        /// Icon qo'shilsa pasdigi ishlidi (Password)
        : TextField(
            controller: controller,
            // textDirection: TextDecoration.none, ///  =>  WHY IS THIS ERROR??????
            onTap: onTap,
            keyboardType: keyBoardType,
            obscureText: obscureText ?? false,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.lFF0000,
                ),
              ),
              labelStyle: const AppTextStyle().labelHide,
              floatingLabelStyle:
                  const AppTextStyle().subText?.copyWith(fontSize: 25),
              label: Text(labelText),
              hintText: hintText,
              hintStyle: const AppTextStyle().hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.lD9D9D9,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.lD9D9D9,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.l00B533,
                  width: 1,
                ),
              ),
              suffixIcon: suffixIcon,
            ),
          );
  }
}
