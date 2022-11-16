import 'package:flutter/material.dart';
import 'package:student_app_bloc/core/constants.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kzblack,
        body: Center(
          child: Text("Hello world"),
        ));
  }
}
