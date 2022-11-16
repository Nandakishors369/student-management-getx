// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:student_app_bloc/core/constants.dart';
import 'package:student_app_bloc/presentation/screen_home.dart';
import 'package:student_app_bloc/presentation/screen_list.dart';

class ScreenNavigationBar extends StatefulWidget {
  const ScreenNavigationBar({super.key});

  @override
  State<ScreenNavigationBar> createState() => _ScreenNavigationBarState();
}

class _ScreenNavigationBarState extends State<ScreenNavigationBar> {
  final List screens = [ScreenHome(), ScreenList()];
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: screens[_currentindex],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: Colors.transparent),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    iconSize: 24,
                    backgroundColor: kzblack,
                    elevation: 0,
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
                            Icons.headphones,
                            color: kWhite,
                          ),
                          label: ''),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );

    /* Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          backgroundColor: kzblack,
          elevation: 0,
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
                  Icons.add_circle_outline,
                  size: 40,
                  color: kzlightBlue,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.headphones,
                  color: kWhite,
                ),
                label: ''),
          ],
        ),
      ),
      body: screens[_currentindex],
    ); */
  }
}
