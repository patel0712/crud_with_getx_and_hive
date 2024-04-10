import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId:0)
class Student{

  @HiveField(0)
  final int? rollNo;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int? age;

  @HiveField(3)
  final int? phoneNo;

  @HiveField(4)
  final String? address;

  @HiveField(5)
  final bool? isMale;

  const Student({
    required this.name,
    this.rollNo,
    this.phoneNo,
    this.age,
    this.isMale,
    this.address
  });

}