import 'package:flutter/material.dart';
import 'package:student_app_bloc/core/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/heading.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kzblack,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Heading(
                  title: 'Student List',
                ),
                StudentList()
              ],
            ),
          ),
        ));
  }
}

class StudentList extends StatelessWidget {
  const StudentList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 30,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green,
            ),
            title: Text(
              "hello",
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
  }
}
