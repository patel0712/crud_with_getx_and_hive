// hive_helper.dart
import 'package:hive/hive.dart';
import '../hive_model/student_model.dart';
import '../widgets&colors/screen_components.dart';

class HiveHelper {
  final Box<Student> studentBox = Hive.box<Student>('student');

  void add(Student student) {
    studentBox.add(student);
    showSnackbar('Student added Successfully...');
  }

  void update(int index,Student student) {
    studentBox.putAt(index,student);
    showSnackbar('Student updated Successfully...');
  }

  void delete(int index) {
    studentBox.deleteAt(index);
    showSnackbar('Student deleted Successfully...');
  }

  Student? getStudent(int rollNo) {
    return studentBox.get(rollNo);
  }

  List<Student> getStudentList() {
    return studentBox.values.toList();
  }
}
