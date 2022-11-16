// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_app_bloc/core/constants.dart';
import 'package:student_app_bloc/presentation/screen_home.dart';
import 'package:student_app_bloc/presentation/screen_add.dart';

class ScreenNavigationBar extends StatefulWidget {
  const ScreenNavigationBar({super.key});

  @override
  State<ScreenNavigationBar> createState() => _ScreenNavigationBarState();
}

class _ScreenNavigationBarState extends State<ScreenNavigationBar> {
  final List screens = [ScreenHome(), ScreenAdd()];
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentindex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(blurRadius: 20, color: kzblack),
          BoxShadow(blurRadius: 20, color: kzblack),
          BoxShadow(blurRadius: 20, color: kzblack),
          BoxShadow(blurRadius: 20, color: kzblack),
          BoxShadow(blurRadius: 20, color: kzblack),
          BoxShadow(blurRadius: 20, color: kzblack),
          BoxShadow(blurRadius: 20, color: kzblack),
          BoxShadow(blurRadius: 20, color: kzblack),
          BoxShadow(blurRadius: 20, color: kzblack),
          BoxShadow(blurRadius: 20, color: kzblack),
          BoxShadow(blurRadius: 30, color: kzblack),
          BoxShadow(blurRadius: 40, color: kzblack),
          BoxShadow(blurRadius: 40, color: kzblack),
          BoxShadow(blurRadius: 40, color: kzblack)
        ]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          iconSize: 24,
          backgroundColor: kzblack,
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
          currentIndex: _currentindex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  color: kWhite,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: kWhite,
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}
