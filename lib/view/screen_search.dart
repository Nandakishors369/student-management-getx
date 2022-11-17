import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_bloc/core/constants.dart';

import 'scree_edit.dart';
import 'screen_home.dart';

class StudentSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(
              context,
              null,
            );
          } else {
            query = ' ';
          }
        },
        icon: const Icon(
          Icons.clear,
        ),
      )
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          color: Colors.white,
        ),
      ),
      hintColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: kztext,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          const InputDecorationTheme(
            border: InputBorder.none,
          ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(
          context,
          null,
        );
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

// search element
  @override
  Widget buildSuggestions(BuildContext context) {
    final searched = getxController.studentlist
        .where(
          (element) => element.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return Scaffold(
      backgroundColor: kzblack,
      body: searched.isEmpty
          ? Center(
              child: Text(
                "No Search Result !",
                style: popupTextStyle,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(),
                      child: ListTile(
                        leading: CircleAvatar(
                          maxRadius: 30,

                          backgroundImage:
                              FileImage(File(searched[index].image.toString())),
                          // backgroundImage: AssetImage(
                          //   widget.allAudios[index].metas.image!.path,
                          // ),

                          //AssetImage(audioList[index].metas.image!.path),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        onTap: () async {
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
                                      backgroundImage: FileImage(File(
                                          searched[index].image.toString())),
                                    ),
                                  ],
                                ),
                                kheight20,
                                Text(
                                  '''Name : ${searched[index].name}''',
                                  style: popupTextStyle,
                                ),
                                kheight20,
                                Text(
                                  'Age : ${searched[index].age}',
                                  style: popupTextStyle,
                                ),
                                kheight20,
                                Text(
                                  'Class : ${searched[index].classs}',
                                  style: popupTextStyle,
                                ),
                                kheight20,
                                Text(
                                  'Division : ${searched[index].division}',
                                  style: popupTextStyle,
                                ),
                                kheight20,
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("Ok")),
                              TextButton(
                                  onPressed: (() async {
                                    await Get.to(ScreenEdit(index: index));
                                    Get.back();
                                  }),
                                  child: Text("Edit")),
                            ],
                          ));
                          /* Get.bottomSheet(BottomSheetWidgets(
                            index: index,
                          )); */
                        },
                        title: Padding(
                          padding: const EdgeInsets.only(
                            left: 5.0,
                            bottom: 3,
                            top: 3,
                          ),
                          child: Text(searched[index].name,
                              /* getxController.studentlist[index].name, */
                              overflow: TextOverflow.ellipsis,
                              style: kListStyle),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: searched.length),
            ),
    );
  }
}
