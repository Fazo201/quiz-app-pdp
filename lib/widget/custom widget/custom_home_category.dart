import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/style/app_text_style.dart';

class CustomHomeCategory extends StatelessWidget {
  const CustomHomeCategory(
      {super.key,
        required this.color,
        required this.image,
        required this.text,
        this.goLocation,
      });

  final SvgPicture image;
  final Color color;
  final String text;
  final String? goLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142,
      width: 142,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 118,
              width: 75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: image,
                  ),
                  Text(
                    text,
                    style: const AppTextStyle().titleMedium,
                  ),
                ],
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
    );
  }
}
