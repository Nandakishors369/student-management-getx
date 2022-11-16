import 'dart:developer';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_bloc/main.dart';
import 'package:student_app_bloc/model/student_model.dart';

class StudentController extends GetxController {
  var studentlist = <StudenDetails>[].obs;
  String? pickedimage;
  void onReady() {
    studentlist.value.clear();
    studentlist.value.addAll(dbStudent.values);

    super.onReady();
    update();
  }

  getGallery() async {
    final images = await ImagePicker().pickImage(source: ImageSource.gallery);

    pickedimage = images!.path;
    update();
  }

  getCamera() async {
    final images = await ImagePicker().pickImage(source: ImageSource.camera);

    pickedimage = images!.path;
    update();
  }

  addStudent(StudenDetails studenDetails) {
    dbStudent.add(studenDetails);
    studentlist.add(studenDetails);
    log(studenDetails.toString());
    update();
  }

  deleteStudent(int index) async {
    await dbStudent.deleteAt(index);
    studentlist.removeAt(index);
  }

  updateStudent(StudenDetails newValue, int index) async {
    await dbStudent.putAt(index, newValue);
    studentlist.value[index] = newValue;
  }
}
