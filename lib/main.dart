import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_app_bloc/model/db/db_functions.dart';
import 'package:student_app_bloc/model/student_model.dart';
import 'package:student_app_bloc/view/navigation.dart';

//
late Box<StudenDetails> dbStudent;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudenDetailsAdapter().typeId)) {
    Hive.registerAdapter(StudenDetailsAdapter());
  }
  dbStudent = await Hive.openBox<StudenDetails>('studentlist');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ScreenNavigationBar());
  }
}
