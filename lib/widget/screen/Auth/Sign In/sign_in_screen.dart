import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/route/app_route_name.dart';
import 'package:quiz_app/widget/custom%20widget/custom_richtext.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomRichText(
          text: "Don't have an account?",
          navigateText: "Sign In",
          onTap: () {
            context.go("${AppRouteName.signIn}/${AppRouteName.signUp}");
          },
        ),
      ),
    );
  }
}
