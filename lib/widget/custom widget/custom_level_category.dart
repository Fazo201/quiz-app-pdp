import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_text_style.dart';

class CustomLevelCategory extends StatelessWidget {
  const CustomLevelCategory(
      {super.key,
        required this.image,
        required this.text,
        this.goLocation,
      });

  final dynamic image;
  final String text;
  final String? goLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lF5F5F5,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 32,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 32,
                        width: 112,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            image,
                            Text(
                              text,
                              style: const AppTextStyle().titleMedium,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "9/0",
                            style: const AppTextStyle().titleSmall,
                          ),
                          const Icon(Icons.chevron_right,size: FontSize.size26)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                goLocation != null ? context.go(goLocation!):null;
              },
              height: double.infinity,
              minWidth: double.infinity,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              ),
            ),
          ],
        ),
      ),
    );
  }
}
