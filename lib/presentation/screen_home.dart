import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:student_app_bloc/controller/getx_controller.dart';
import 'package:student_app_bloc/core/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_bloc/main.dart';
import 'package:student_app_bloc/model/student_model.dart';

import 'widgets/heading.dart';

class ScreenHome extends StatelessWidget {
  final getxController = Get.put(StudentController());
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
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dbStudent.values.length,
              itemBuilder: (context, index) {
                final data = getxController.studentlist[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                    ),
                    title: Text(
                      data.name,
                      style: kListStyle,
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: kzwhite,
                        )),
                  ),
                );
              },
            );
          },
        )));
  }
}
