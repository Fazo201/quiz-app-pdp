import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/route/app_route_name.dart';
import 'package:quiz_app/widget/custom%20widget/custom_richtext.dart';
import '../../../custom widget/Custom TextField/custom_textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailC.dispose();
    passC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Spacer(),
            CustomTextField(
              controller: emailC,
              keyBoardType: TextInputType.emailAddress,
              obscureText: true,
              hintText: "example@gmail.com",
              labelText: "Phone Number",
            ),
            const Spacer(),
            CustomRichText(
              text: "Don't have an account?",
              navigateText: "Sign In",
              onTap: () {
                context.go("${AppRouteName.signIn}/${AppRouteName.signUp}");
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
