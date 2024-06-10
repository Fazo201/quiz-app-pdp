import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_route_name.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_images.dart';
import '../../../../core/style/app_text_style.dart';
import '../../../custom widget/Custom TextField/custom_textfield.dart';
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

  bool checkBox = false;
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
                      ? const Icon(Icons.visibility,
                      color: Color(0xFFADADAD))
                      : const Icon(Icons.visibility_off,
                      color: Color(0xFFADADAD))),
              onTap: (){
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  color: AppColors.lD9D9D9,
                  style: ButtonStyle(
                    shadowColor:
                        WidgetStateProperty.all<Color>(Colors.transparent),
                  ),
                  onPressed: () {
                    checkBox = !checkBox;
                    setState(() {});
                  },
                  icon: checkBox
                      ? const Icon(Icons.check_box)
                      : const Icon(Icons.check_box_outline_blank),
                ),
                Text(
                  "Accept terms & Condition",
                  style: const AppTextStyle().bodySmall?.copyWith(
                        color: AppColors.lD9D9D9,
                        fontSize: 11,
                      ),
                ),
              ],
            ),
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
            AppImages.googleLogo,
            const Spacer(),
            CustomRichText(
              text: "Already have an account?",
              navigateText: "Sign In",
              onTap: () {
                context.pop();
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
