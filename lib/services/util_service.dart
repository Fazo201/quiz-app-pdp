import 'package:flutter/material.dart';
import 'package:quiz_app/core/style/app_colors.dart';

sealed class Utils {
  
  static void fireSnackBar(String msg, BuildContext context,{bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: error?Colors.red: AppColors.l00B533,
        content: Text(msg, style: const TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
        duration: const Duration(milliseconds: 2500),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

}