import 'package:flutter/material.dart';

class Utils{
  static void fireSnackBar(BuildContext context,String msg,){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: const TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center),
        backgroundColor: Colors.grey.shade400.withOpacity(0.975),
        duration: const Duration(milliseconds: 2500),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        shape: const StadiumBorder(),
      )
    );
  }
}