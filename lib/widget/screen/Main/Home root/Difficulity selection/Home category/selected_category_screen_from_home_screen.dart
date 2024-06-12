import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Assuming you have these defined somewhere in your project
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_images.dart';
import 'package:quiz_app/core/style/app_text_style.dart';

class SelectedCategoryScreenFromHomeScreen extends StatefulWidget {
  const SelectedCategoryScreenFromHomeScreen({super.key});

  @override
  State<SelectedCategoryScreenFromHomeScreen> createState() =>
      _SelectedCategoryScreenFromHomeScreenState();
}

class _SelectedCategoryScreenFromHomeScreenState
    extends State<SelectedCategoryScreenFromHomeScreen> {
  int current = 0;
  String? value;

  final List<String> modules = [
    "1-modul",
    "2-modul",
    "3-modul",
    "4-modul",
    "5-modul",
    "6-modul",
    "7-modul",
    "8-modul",
    "9-modul",
  ];

  final List<String> dropDownMenuList = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 180,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_sharp),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                    Text(
                      "Back",
                      style: const AppTextStyle().orSignInWith?.copyWith(
                            fontSize: 15,
                            color: AppColors.black,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                AppImages.largeFlutter,
                const SizedBox(height: 25),
                Text(
                  "Flutter",
                  style: const AppTextStyle()
                      .titleMedium
                      ?.copyWith(color: AppColors.black),
                ),
              ],
            ),
            const SizedBox(width: 48), // Placeholder for spacing
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 74,
                      decoration: BoxDecoration(
                        color: current == index
                            ? AppColors.l00B533
                            : AppColors.lF5F5F5,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          modules[index],
                          style: const AppTextStyle().richText?.copyWith(
                                fontSize: 12,
                                color: current == index
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                icon: const Icon(Icons.add),
                isExpanded: true,
                // disabledHint: Text("Select an item", style: const AppTextStyle().titleSmall),
                value: value,
                isDense: true,
                dropdownColor: AppColors.white,
                // alignment: AlignmentDirectional.bottomEnd,
                hint: Text("1. Lorem Ipsum dolor sit amet",
                    style: const AppTextStyle().titleSmall),
                items: dropDownMenuList.map(buildMenuItem).toList(),
                onChanged: (value) {
                  setState(() {
                    this.value = value;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem<String>(
        // alignment: AlignmentDirectional.topEnd,
        // enabled: false,
        value: item,
        child: Text(
          item,
          style: const AppTextStyle().titleSmall?.copyWith(fontSize: 16),
        ),
      );
}
