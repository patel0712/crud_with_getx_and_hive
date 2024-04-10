import 'package:get/get.dart';
import 'package:getx_student_with_hive/student/student_controller.dart';

class StudentBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => StudentController());
  }
}