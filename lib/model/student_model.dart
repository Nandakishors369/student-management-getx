import 'package:hive_flutter/adapters.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudenDetails {
  @HiveField(0)
  String name;
  @HiveField(1)
  String age;
  @HiveField(2)
  String classs;
  @HiveField(3)
  String division;
  @HiveField(4)
  int? id;
  @HiveField(5)
  String? image;
  StudenDetails(
      {required this.name,
      required this.age,
      required this.classs,
      required this.division,
      this.id,
      required this.image});
}
