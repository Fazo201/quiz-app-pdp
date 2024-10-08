import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/route/app_route_path.dart';
import 'package:quiz_app/core/style/app_colors.dart';
import 'package:quiz_app/core/style/app_images.dart';
import 'package:quiz_app/core/style/app_text_style.dart';

class SelectedCategoryScreenFromHomeScreen extends StatefulWidget {
  final int difficultyTime;
  const SelectedCategoryScreenFromHomeScreen({super.key,required this.difficultyTime});

  @override
  State<SelectedCategoryScreenFromHomeScreen> createState() =>
      _SelectedCategoryScreenFromHomeScreenState();
}

class _SelectedCategoryScreenFromHomeScreenState
    extends State<SelectedCategoryScreenFromHomeScreen> {
  int current = 0;
  String? value;
  late List<bool> _isOpen;

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
  void initState() {
    super.initState();
    _isOpen = List<bool>.filled(dropDownMenuList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        toolbarHeight: 180,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SizedBox(
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
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dropDownMenuList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.lF5F5F5,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text(
                            '${index + 1}.',
                            style: const AppTextStyle().titleSmall?.copyWith(
                              fontSize: 16
                            ),
                          ),
                          title: Text(
                            dropDownMenuList[index],
                            style: const AppTextStyle().titleSmall?.copyWith(
                              fontSize: 16
                            ),
                          ),
                          trailing: _isOpen[index]
                                ? const Icon(Icons.close,color: Colors.red)
                                : const Icon(Icons.add),
                          onTap: (){
                            setState(() {
                              _isOpen[index] = !_isOpen[index];
                            });
                          },
                        ),
                        if (_isOpen[index])
                          Column(
                            children: [
                              ListTile(
                                title: Text(dropDownMenuList[0]),
                              ),
                              ListTile(title: Text(dropDownMenuList[1])),
                              ListTile(
                                title: Text(dropDownMenuList[2]),
                              ),
                              ListTile(
                                title: Text(dropDownMenuList[3]),
                              ),
                              ListTile(
                                title: Text(dropDownMenuList[4]),
                              ),
                              ListTile(
                                title: Text(dropDownMenuList[5]),
                              ),
                              ListTile(
                                title: Text(dropDownMenuList[6]),
                              ),
                              ListTile(
                                title: Text(dropDownMenuList[7]),
                              ),
                              ListTile(
                                title: Text(dropDownMenuList[8]),
                              ),
                              ListTile(
                                title: Text(dropDownMenuList[9]),
                              ),
                              ListTile(
                                trailing: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: MaterialButton(
                                    color: AppColors.l00B533,
                                    onPressed: () {
                                      context.go("${AppRoutePath.home}/${AppRoutePath.difficultySelection}/${AppRoutePath.homeCategory}/${AppRoutePath.quizGame}", extra: widget.difficultyTime);
                                    },
                                    child: const Text(
                                      "Start Quiz",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}