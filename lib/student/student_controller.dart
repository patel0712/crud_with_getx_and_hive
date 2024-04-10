import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_student_with_hive/hive/hive_helper.dart';
import 'package:getx_student_with_hive/hive_model/student_model.dart';

class StudentController extends GetxController {
  final HiveHelper hiveHelper = Get.put(HiveHelper());

  TextEditingController nameController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RxBool isMale = true.obs;
  RxBool isEditMode = false.obs;
  int selectedIndex = -1;

  RxList<Student> studentList = <Student>[].obs;

  @override
  void onInit() {
    super.onInit();
    // final Student student = Get.arguments as Student;
    //   preFillValue(student);
    getStudentList();
  }

  void clearControllers() {
    nameController.clear();
    rollNoController.clear();
    ageController.clear();
    phoneNoController.clear();
    addressController.clear();
  }

  void preFillValue(Student student) {
    nameController.text = student.name;
    rollNoController.text = student.rollNo.toString();
    ageController.text = student.age.toString();
    phoneNoController.text = student.phoneNo.toString();
    addressController.text = student.address.toString();
    isMale.value = student.isMale!;
  }


  void addOrUpdate(Student student) {
    if (isEditMode.value) {
      updateStudent();
      clearControllers();
      isEditMode(false);
    } else {
      addStudent(student);
    }
  }

  void addStudent(Student student) {
    isEditMode(false);
    final Student newStudent = Student(
        name: nameController.text,
        rollNo: int.parse(rollNoController.text),
        age: int.parse(ageController.text),
        phoneNo: int.parse(phoneNoController.text),
        address: addressController.text,
        isMale: isMale.value);
    hiveHelper.add(newStudent);
    clearControllers();
    getStudentList();
  }

  void updateStudent() {
    if(selectedIndex != -1){
      // preFillValue(student)
      final Student updatedStudent = Student(
        name: nameController.text,
        rollNo: int.parse(rollNoController.text),
        age: int.parse(ageController.text),
        phoneNo: int.parse(phoneNoController.text),
        address: addressController.text,
        isMale: isMale.value);
    hiveHelper.update(selectedIndex,updatedStudent);
    getStudentList();
    }
  }

  void deleteStudent() {
    if (selectedIndex != -1) {
      hiveHelper.delete(selectedIndex);
      getStudentList();
    }
  }

  void getStudentList() {
    studentList.refresh();
    studentList.assignAll(hiveHelper.getStudentList());
  }

  Student? getStudent(int rollNo) {
    return hiveHelper.getStudent(rollNo);
  }
}


// if (selectedIndex != -1) {
//
//   // studentController.studentList[studentController.selectedIndex];
// }