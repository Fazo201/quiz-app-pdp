import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:quiz_app/core/route/app_route_name.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_images.dart';
import 'package:quiz_app/widget/custom%20widget/custom_richtext.dart';
import '../../../custom widget/custom_keyboard_button.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {

  TextEditingController pinC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    pinC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 70,
      margin: const EdgeInsets.only(left: 6, right: 6),
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.lD9D9D9, width: 1),
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Spacer(),
              AppImages.signInPdpLogo,
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Pinput(
                      length: 4,
                      defaultPinTheme: defaultPinTheme,
                      controller: pinC,
                      keyboardType: TextInputType.none,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: Colors.green),
                        ),
                      ),
                      onCompleted: (pin) => context.go(AppRouteName.home),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const CustomRichText(text: "Send again after", navigateText: " ( 59 seconds )"),
              const Spacer(),
              SizedBox(
                height: 272,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomKeyboardButton(
                          onPressed: () {
                            if(pinC.text.length < 4){
                              setState(() => pinC.text += "1");
                            }
                          },
                          text: "1",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if(pinC.text.length < 4){
                              setState(() => pinC.text += "2");
                            }
                          },
                          text: "2",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if(pinC.text.length < 4){
                              setState(() => pinC.text += "3");
                            }
                          },
                          text: "3",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomKeyboardButton(
                          onPressed: () {
                            if(pinC.text.length < 4){
                              setState(() => pinC.text += "4");
                            }
                          },
                          text: "4",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if(pinC.text.length < 4){
                              setState(() => pinC.text += "5");
                            }
                          },
                          text: "5",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if(pinC.text.length < 4){
                              setState(() => pinC.text += "6");
                            }
                          },
                          text: "6",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomKeyboardButton(
                          onPressed: () {
                            if(pinC.text.length < 4){
                              setState(() => pinC.text += "7");
                            }
                          },
                          text: "7",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if(pinC.text.length < 4){
                              setState(() => pinC.text += "8");
                            }
                          },
                          text: "8",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if(pinC.text.length < 4){
                              setState(() => pinC.text += "9");
                            }
                          },
                          text: "9",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomKeyboardButton(
                          onPressed: () {
                            pinC.clear();
                            context.pop();
                          },
                          icon: Icons.keyboard_return,
                          iconSize: 24,
                          iconColor: AppColors.l264653,
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            if(pinC.text.length < 4){
                              setState(() => pinC.text += "0");
                            }
                          },
                          text: "0",
                        ),
                        const SizedBox(width: 11.99),
                        CustomKeyboardButton(
                          onPressed: () {
                            pinC.text = pinC.text.substring(0, pinC.text.length-1);
                          },
                          icon: Icons.backspace_outlined,
                          iconSize: 24,
                          iconColor: AppColors.l264653,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}