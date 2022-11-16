import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_bloc/controller/getx_controller.dart';
import 'package:student_app_bloc/core/constants.dart';
import 'package:student_app_bloc/model/db/db_functions.dart';
import 'package:student_app_bloc/model/student_model.dart';
import 'package:student_app_bloc/presentation/widgets/heading.dart';
import 'package:student_app_bloc/presentation/widgets/textfield.dart';

class ScreenAdd extends StatelessWidget {
  ScreenAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kzblack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Heading(title: "Add Student"),
              const SizedBox(
                height: 20,
              ),
              AddStudent()
            ],
          ),
        ),
      ),
    );
  }
}

class AddStudent extends StatelessWidget {
  StudentController getxcontroller = Get.put(StudentController());
  AddStudent({
    Key? key,
  }) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController divisionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            GetBuilder<StudentController>(builder: (data) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      data.getGallery();
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: kzwhite,
                          radius: 60,
                          backgroundImage: data.pickedimage == null
                              ? const NetworkImage(
                                  "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg")
                              : FileImage(File(data.pickedimage!))
                                  as ImageProvider,
                        ),
                        Positioned(
                          right: -24,
                          bottom: -3,
                          child: RawMaterialButton(
                            onPressed: () {
                              data.getCamera();
                            },
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundColor: kztext,
                              child: Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: kzwhite,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }),
            kheight,
            TextForm(
              Controller: nameController,
              label: 'Name',
            ),
            kheight,
            TextForm(Controller: ageController, label: "Age"),
            kheight,
            TextForm(Controller: classController, label: "Class"),
            kheight,
            TextForm(Controller: divisionController, label: "Division"),
            kheight,
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  final studentsinfo = StudenDetails(
                      name: nameController.text,
                      age: ageController.text,
                      classs: classController.text,
                      division: divisionController.text,
                      image: getxcontroller.pickedimage);
                  getxcontroller.addStudent(studentsinfo);
                },
                child: Text(
                  "Submit",
                  style: kListStyle,
                ),
                style: ElevatedButton.styleFrom(backgroundColor: kztext),
              ),
            )
          ],
        ),
      ),
    );
  }
}
