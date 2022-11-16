import 'package:flutter/material.dart';
import 'package:student_app_bloc/core/constants.dart';
import 'package:student_app_bloc/presentation/widgets/heading.dart';

class ScreenAdd extends StatelessWidget {
  const ScreenAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kzblack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Heading(title: "Add Student"),
              SizedBox(
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
  const AddStudent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: kzwhite,
                  radius: 60,
                )
              ],
            ),
            kheight,
            TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: kListStyle,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: kztext),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: kztext,
                  ),
                ),
              ),
            ),
            kheight,
            TextFormField(
              decoration: InputDecoration(
                labelText: "Age",
                labelStyle: kListStyle,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: kztext),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: kztext,
                  ),
                ),
              ),
            ),
            kheight,
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Class',
                labelStyle: kListStyle,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: kztext),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: kztext,
                  ),
                ),
              ),
            ),
            kheight,
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Division',
                labelStyle: kListStyle,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: kztext),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: kztext,
                  ),
                ),
              ),
            ),
            kheight,
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
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
