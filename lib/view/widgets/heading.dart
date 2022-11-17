import 'package:flutter/material.dart';
import 'package:student_app_bloc/core/constants.dart';

class Heading extends StatelessWidget {
  String title;
  Heading({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            title,
            style: kHeadingStyle,
          ),
        ),
      ],
    );
  }
}
