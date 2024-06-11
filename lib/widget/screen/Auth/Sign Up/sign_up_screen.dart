import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_route_name.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_images.dart';
import '../../../../core/style/app_text_style.dart';
import '../../../custom widget/Custom TextField/custom_textfield.dart';
import '../../../custom widget/custom_checkbox.dart';
import '../../../custom widget/custom_richtext.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  bool obscureText = false;
  bool vision = true;

  @override
  void dispose() {
    super.dispose();
    firstNameC.dispose();
    lastNameC.dispose();
    emailC.dispose();
    passC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Create an account",
                      style: const AppTextStyle().titleLarge,
                    ),
                    Text(
                      "\nLet’s help you set up your account,\nit won’t take long.",
                      style: const AppTextStyle().titleSmall?.copyWith(
                            color: AppColors.l121212,
                            fontSize: 11,
                          ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            CustomTextField(
              controller: firstNameC,
              hintText: "Enter First Name",
              labelText: "First Name",
              keyBoardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: lastNameC,
              hintText: "Enter Last Name",
              labelText: "Last Name",
              keyBoardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: emailC,
              hintText: "+example@gmail.com",
              labelText: "Email",
              keyBoardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: passC,
              hintText: "Password",
              labelText: "Password",
              obscureText: obscureText,
              keyBoardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              suffixIcon: IconButton(
                  onPressed: () {
                    vision = !vision;
                    obscureText = !obscureText;
                    setState(() {});
                  },
                  icon: vision
                      ? const Icon(Icons.visibility, color: Color(0xFFADADAD))
                      : const Icon(Icons.visibility_off,
                          color: Color(0xFFADADAD))),
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            const SizedBox(height: 20),
            const CustomCheckbox(),
            const SizedBox(height: 21),
            MaterialButton(
              onPressed: () {
                context.go(
                    "${AppRouteName.signIn}/${AppRouteName.signUp}/${AppRouteName.verificationCode}");
              },
              color: AppColors.l00B533,
              height: 60,
              minWidth: double.infinity,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide.none,
              ),
              child: Text(
                "Sign Up",
                style: const AppTextStyle().titleMedium?.copyWith(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.lD9D9D9,
                    ),
                  ),
                  Text(
                    "  Or Sign in With  ",
                    style: const AppTextStyle().orSignInWith,
                  ),
                  const Expanded(
                    child: Divider(
                      color: AppColors.lD9D9D9,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.10),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: AppImages.googleLogo,
            ),
            const Spacer(),
            CustomRichText(
              text: "Already have an account?",
              navigateText: "Sign In",
              onTap: () => context.pop(),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
