import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_images.dart';
import 'package:quiz_app/core/style/app_text_style.dart';
import 'package:quiz_app/widget/custom%20widget/Custom%20TextField/custom_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  File? file;
  bool isCamera = false;
  TextEditingController nameC = TextEditingController();
  TextEditingController lastC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmC = TextEditingController();

  @override
  void dispose() {
    nameC.dispose();
    lastC.dispose();
    passwordC.dispose();
    confirmC.dispose();
    super.dispose();
  }

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (xFile != null) {
      file = File(xFile.path);
    }
    setState(() {});
  }

  Future<void> deleteImage() async {
    file = null;
    setState(() {});
  }

  ImageProvider<Object>? profileImage({File? file}) {
    return file != null
        ? Image.file(file).image
        : null;
  }

  @override
  void initState() {
    firebaseAuth = FirebaseAuth.instance;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 219,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: onPressed,
                        onLongPress: onLongPress,
                        height: 109,
                        minWidth: 109,
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.transparent,
                          backgroundImage: profileImage(file: file),
                          child: file==null ? AppImages.profilePersonIcon:null,
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "User name",
                              style: const AppTextStyle().titleSmall,
                            ),
                            Text(
                              "${firebaseAuth.currentUser?.displayName?.split('/')[0]} ${firebaseAuth.currentUser?.displayName?.split('/')[1]}",
                              style: const AppTextStyle().profileTitle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "User email",
                              style: const AppTextStyle().titleSmall,
                            ),
                            Text(
                              "${firebaseAuth.currentUser?.email}",
                              style: const AppTextStyle().profileTitle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        color: AppColors.lD9D9D9,
                      ),
                      SizedBox(
                        height: 36,
                        width: 155,
                        child: Text(
                          "Enter your information to make changes",
                          style: const AppTextStyle().titleSmall,
                        ),
                      ),
                      CustomTextField(
                          hintText: "Enter First Name",
                          controller: nameC,
                          keyBoardType: TextInputType.name,
                          labelText: "First Name",
                          textInputAction: TextInputAction.next),
                      CustomTextField(
                          hintText: "Enter Last Name",
                          controller: lastC,
                          keyBoardType: TextInputType.name,
                          labelText: "Last Name",
                          textInputAction: TextInputAction.next),
                      CustomTextField(
                          hintText: "Enter Password",
                          controller: passwordC,
                          keyBoardType: TextInputType.name,
                          labelText: "Password",
                          textInputAction: TextInputAction.next),
                      CustomTextField(
                          hintText: "Retype Password",
                          controller: nameC,
                          keyBoardType: TextInputType.name,
                          labelText: "Confirm Password",
                          textInputAction: TextInputAction.next),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressed() {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 120,
          child: Column(
            children: [
              MaterialButton(
                onPressed: () async {
                  Navigator.pop(context);
                  isCamera = true;
                  await getImage();
                },
                minWidth: double.infinity,
                child: const Text('Camera'),
              ),
              MaterialButton(
                onPressed: () async {
                  Navigator.pop(context);
                  isCamera = false;
                  await getImage();
                },
                minWidth: double.infinity,
                child: const Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }

  void onLongPress() {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 120,
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  onPressed();
                },
                minWidth: double.infinity,
                child: const Text('Edit'),
              ),
              MaterialButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await deleteImage();
                },
                minWidth: double.infinity,
                child: const Text('Delete'),
              ),
            ],
          ),
        );
      },
    );
  }
}

