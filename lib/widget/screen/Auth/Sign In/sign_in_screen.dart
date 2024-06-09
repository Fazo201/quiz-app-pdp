import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/route/app_route_name.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_images.dart';
import 'package:quiz_app/core/style/app_text_style.dart';
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

  bool obscureText = false;
  bool vision = true;

  @override
  void dispose() {
    super.dispose();
    emailC.dispose();
    passC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Spacer(),
            AppImages.signInPdpLogo,
            const Spacer(),
            /// Texts
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Hello,",
                      style: const AppTextStyle().bodyLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Your are welcome",
                      style: const AppTextStyle().subText,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            CustomTextField(
              controller: emailC,
              keyBoardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              hintText: "example@gmail.com",
              labelText: "Email",
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: passC,
              keyBoardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: obscureText,
              hintText: "Password",
              labelText: "Password",
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
            const SizedBox(height: 25),
            MaterialButton(
              onPressed: () {},
              color: AppColors.l00B533,
              height: 60,
              minWidth: double.infinity,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide.none,
              ),
              child: Text(
                "Sign In",
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
            const SizedBox(height: 30),
            AppImages.googleLogo,
            const Spacer(),
            CustomRichText(
              text: "Don't have an account?",
              navigateText: "Sign Up",
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
