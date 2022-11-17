import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:student_app_bloc/controller/getx_controller.dart';
import 'package:student_app_bloc/model/student_model.dart';
import 'package:student_app_bloc/view/widgets/heading.dart';
import 'package:student_app_bloc/view/widgets/textfield.dart';

import '../core/constants.dart';

class ScreenEdit extends StatelessWidget {
  int index;
  ScreenEdit({super.key, required this.index});
  StudentController getxcontroller = Get.put(StudentController());
  final formGlobalKey = GlobalKey<FormState>();
  String? img;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController divisionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kzblack,
      body: SafeArea(
        child: Form(
          key: formGlobalKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Heading(title: "Edit Student"),
                  kheight,
                  GetBuilder<StudentController>(builder: (data) {
                    final datas = getxcontroller.studentlist[index];
                    nameController.text = datas.name;
                    ageController.text = datas.age;
                    classController.text = datas.classs;
                    divisionController.text = datas.division;

                    img = data.pickedimage;
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
                                backgroundImage: img == null
                                    ? FileImage(File(datas.image.toString()))
                                    : FileImage(File(img!)) as ImageProvider,
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
                        final isValid = formGlobalKey.currentState!.validate();
                        if (isValid) {
                          final studentsinfo = StudenDetails(
                              name: nameController.text,
                              age: ageController.text,
                              classs: classController.text,
                              division: divisionController.text,
                              image: getxcontroller.pickedimage ??
                                  getxcontroller.studentlist[index].image);
                          getxcontroller.updateStudent(studentsinfo, index);

                          nameController.clear();
                          ageController.clear();
                          divisionController.clear();
                          classController.clear();
                        }
                        Get.back();
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
          ),
        ),
      ),
    );
  }
}
