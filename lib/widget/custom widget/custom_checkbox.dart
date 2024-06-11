import 'package:flutter/material.dart';
import '../../core/style/app_colors.dart';
import '../../core/style/app_text_style.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool checkBox = false;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          color: color,
          style: ButtonStyle(
            shadowColor: WidgetStateProperty.all<Color>(Colors.transparent),
          ),
          onPressed: () {
            checkBox = !checkBox;
            // checkBox == !checkBox ? color = AppColors.l00B533 : AppColors.lD9D9D9;
            setState(() {});
          },
          icon: checkBox
              ? const Icon(Icons.check_box, color: AppColors.l00B533)
              : const Icon(Icons.check_box_outline_blank,
                  color: AppColors.lD9D9D9),
        ),
        Text(
          "Accept terms & Condition",
          style: const AppTextStyle().bodySmall?.copyWith(
                color: checkBox ? AppColors.l00B533 : AppColors.lD9D9D9,
                fontSize: 11,
              ),
        ),
      ],
    );
  }
}
