import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/style/app_text_style.dart';
import 'package:quiz_app/services/util_service.dart';

import '../../core/style/app_colors.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController questionC = TextEditingController();
  final TextEditingController firstC = TextEditingController();
  final TextEditingController secondC = TextEditingController();
  final TextEditingController correctAnswerC = TextEditingController();
  final TextEditingController searchC = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    questionC.dispose();
    firstC.dispose();
    secondC.dispose();
    correctAnswerC.dispose();
    searchC.dispose();
    super.dispose();
  }

  final CollectionReference myItems = FirebaseFirestore.instance.collection(
      'Quiz collection');

  Future<void> create() async {
    questionC.clear();
    firstC.clear();
    secondC.clear();
    correctAnswerC.clear();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return myDialogBox(
          name: "Create new question",
          condition: "Create",
          onPressed: () {
            String question = questionC.text;
            String firstChoice = firstC.text;
            String secondChoice = secondC.text;
            String correctChoice = correctAnswerC.text;
            addItems(
                question: question,
                firstChoice: firstChoice,
                secondChoice: secondChoice,
                correctChoice: correctChoice);
            Navigator.pop(context);
            Utils.fireSnackBar("Successfully created", context, error: false);
            questionC.clear();
            firstC.clear();
            secondC.clear();
            correctAnswerC.clear();
          },
        );
      },
    );
  }

  void addItems({required String question,
    required String firstChoice,
    required String secondChoice,
    required String correctChoice}) {
    myItems.add({
      'question': question.trim(),
      'firstChoice': firstChoice.trim(),
      'secondChoice': secondChoice.trim(),
      'correctChoice': correctChoice.trim(),
    });
  }

  Future<void> update(DocumentSnapshot documentSnapshot) async {
    questionC.text = documentSnapshot["question"];
    firstC.text = documentSnapshot["firstChoice"];
    secondC.text = documentSnapshot["secondChoice"];
    correctAnswerC.text = documentSnapshot["correctChoice"];
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return myDialogBox(
          name: "Update question",
          condition: "Update",
          onPressed: () async {
            String question = questionC.text;
            String firstChoice = firstC.text;
            String secondChoice = secondC.text;
            String correctChoice = correctAnswerC.text;
            await myItems.doc(documentSnapshot.id).update({
              "question": question,
              "firstChoice": firstChoice,
              "secondChoice": secondChoice,
              "correctChoice": correctChoice,
            });
            Navigator.pop(context);
            Utils.fireSnackBar("Successfully updated", context, error: false);
          },
        );
      },
    );
  }

  Future<void> delete(String id) async {
    await myItems.doc(id).delete();
    Utils.fireSnackBar("Successfully deleted", context, error: true);
  }

  String searchText = '';

  void onSearchChange(String value) {
    setState(() {
      searchText = value;
    });
  }

  bool isSearchClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.l00B533,
        title: isSearchClick
            ? Container(
          margin: const EdgeInsets.fromLTRB(40, 10, 0, 10),
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            onChanged: onSearchChange,
            controller: searchC,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(16, 20, 30, 10),
              hintText: "Search...",
              isDense: true,
              border: InputBorder.none,
              hintStyle: const AppTextStyle().richText?.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        )
            : Text("Hi ${firebaseAuth.currentUser?.displayName?.split('/')[0]}",
            style: const AppTextStyle().titleLarge?.copyWith(
                color: AppColors.lD9D9D9)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchClick = !isSearchClick;
                if (!isSearchClick) {
                  searchC.clear();
                  onSearchChange("");
                }
              });
            },
            icon: Icon(
              isSearchClick ? Icons.close : Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        // centerTitle: true,
      ),
      body: StreamBuilder(
        stream: myItems.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final List<DocumentSnapshot> items = streamSnapshot.data!.docs
                .where((doc) =>
                doc['question'].toLowerCase().contains(
                    searchText.toLowerCase())).toList();
            return Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = items[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: AppColors.l00B533,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            documentSnapshot["question"],
                            style: const AppTextStyle().bodyMedium?.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () => update(documentSnapshot),
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () => delete(documentSnapshot.id),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: create,
        backgroundColor: AppColors.l00B533,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }

  Dialog myDialogBox({
    required String name,
    required String condition,
    required VoidCallback onPressed,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            TextField(
              textInputAction: TextInputAction.next,
              controller: questionC,
              decoration: const InputDecoration(
                labelText: "Enter new question",
                hintText: "eg. What is flutter?",
              ),
            ),
            TextField(
              textInputAction: TextInputAction.next,
              controller: firstC,
              decoration: const InputDecoration(
                labelText: "Enter first choice",
                hintText: "eg. Programming language",
              ),
            ),
            TextField(
              textInputAction: TextInputAction.next,
              controller: secondC,
              decoration: const InputDecoration(
                labelText: "Enter second choice",
                hintText: "eg. Computer",
              ),
            ),
            TextField(
              textInputAction: TextInputAction.done,
              controller: correctAnswerC,
              decoration: const InputDecoration(
                labelText: "Enter correct choice",
                hintText: "eg. Framework",
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(condition),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
