import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/core/route/app_route_path.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_images.dart';
import 'package:quiz_app/core/style/app_text_style.dart';
import 'package:quiz_app/services/auth_service.dart';
import 'package:quiz_app/services/storage_service.dart';
import 'package:quiz_app/widget/custom%20widget/Custom%20TextField/custom_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? imageUrl;
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


  Future<void> createImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (xFile != null) {
      await StorageService.upload(path: firebaseAuth.currentUser!.email.toString(), file: File(xFile.path));
    }
    await getImage();
  }

  Future<void> getImage()async{
    final profileImage = await StorageService.getData(path: "${firebaseAuth.currentUser!.email.toString()}/profile_image.jpg");
    if (profileImage!=null) {
      imageUrl = profileImage;
    }else{
      imageUrl = null;
    }
    setState(() {});
  }

  Future<void> deleteImage()async{
    await StorageService.deletePath(path: "${firebaseAuth.currentUser!.email.toString()}/profile_image.jpg");
    await getImage();
    setState(() {});
  }


  @override
  void initState() {
    firebaseAuth = FirebaseAuth.instance;
    super.initState();
  }

  @override
  void didChangeDependencies()async {
    await getImage();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          PopupMenuButton<String>(
            color: AppColors.white,
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'option1',
                  child: ListTile(
                    leading: const Icon(CupertinoIcons.delete),
                    title: Text('Delete account',style: const AppTextStyle().titleSmall),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<String>(
                  value: 'option2',
                  child: ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: Text('Logout',style: const AppTextStyle().titleSmall),
                  ),
                ),
              ];
            },
            onSelected: (String value) async{
              switch (value) {
                case 'option1':
                  await AuthService.deleteAccount();
                  context.go("${AppRoutePath.signIn}/${AppRoutePath.signUp}");
                  break;
                case 'option2':
                  await AuthService.logOut();
                  context.go(AppRoutePath.signIn);
                  break;
              }
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                  backgroundImage: NetworkImage(imageUrl.toString()),
                  child: imageUrl == null ? AppImages.profilePersonIcon:null
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
                        "Change",
                        style: const AppTextStyle().titleMedium?.copyWith(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    const SizedBox(height: 40,)
                  ],
                ),
              ),
            ],
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
          height: 180,
          child: Column(
            children: [
              MaterialButton(
                onPressed: () async {
                  Navigator.pop(context);
                  isCamera = true;
                  await createImage();
                },
                minWidth: double.infinity,
                child: const Text('Camera'),
              ),
              MaterialButton(
                onPressed: () async {
                  Navigator.pop(context);
                  isCamera = false;
                  await createImage();
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
          height: 180,
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
