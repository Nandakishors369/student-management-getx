import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:student_app_bloc/controller/getx_controller.dart';
import 'package:student_app_bloc/core/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_bloc/main.dart';
import 'package:student_app_bloc/model/student_model.dart';
import 'package:student_app_bloc/view/scree_edit.dart';
import 'package:student_app_bloc/view/screen_search.dart';

import 'widgets/heading.dart';

final getxController = Get.put(StudentController());

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kzblack,
        body: SafeArea(
            child: GetBuilder<StudentController>(
          init: StudentController(),
          initState: (_) {},
          builder: (cont) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Heading(title: "Student List"),
                      SizedBox(
                        width: 90,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 4,
                        ),
                        child: IconButton(
                          onPressed: () {
                            showSearch(
                                context: context, delegate: StudentSearch());
                          },
                          icon: Icon(
                            Icons.search,
                            size: 35,
                            color: kztext,
                          ),
                        ),
                      )
                    ],
                  ),
                  HomeListView(getxController: getxController)
                ],
              ),
            );
          },
        )));
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView({
    Key? key,
    required this.getxController,
  }) : super(key: key);

  final StudentController getxController;

  @override
  Widget build(BuildContext context) {
    if (dbStudent.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 160,
          ),
          Center(
            child: Lottie.asset("Assets/lf30_editor_n1gqwcs3.json"),
          ),
        ],
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dbStudent.values.length,
      itemBuilder: (context, index) {
        final data = getxController.studentlist[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            onTap: () {
              Get.dialog(AlertDialog(
                backgroundColor: kzblack,
                title: Text(
                  "Student info",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: kztext)),
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              FileImage(File(data.image.toString())),
                        ),
                      ],
                    ),
                    kheight20,
                    Text(
                      '''Name : ${data.name}''',
                      style: popupTextStyle,
                    ),
                    kheight20,
                    Text(
                      'Age : ${data.age}',
                      style: popupTextStyle,
                    ),
                    kheight20,
                    Text(
                      'Class : ${data.classs}',
                      style: popupTextStyle,
                    ),
                    kheight20,
                    Text(
                      'Division : ${data.division}',
                      style: popupTextStyle,
                    ),
                    kheight20,
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: (() async {
                        await Get.to(ScreenEdit(index: index));
                        Get.back();
                      }),
                      child: Text("Edit")),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Ok"))
                ],
              ));
            },
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: FileImage(
                File(
                  data.image.toString(),
                ),
              ),
            ),
            title: Text(
              data.name,
              style: kListStyle,
            ),
            trailing: IconButton(
                onPressed: () {
                  Get.dialog(AlertDialog(
                    title: Text("Delete Student"),
                    content: Text("Are you sure ?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          getxController.deleteStudent(index);
                          Get.back();
                        },
                        child: Text("Delete"),
                      ),
                    ],
                  ));
                },
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: kzwhite,
                )),
          ),
        );
      },
    );
  }
}
