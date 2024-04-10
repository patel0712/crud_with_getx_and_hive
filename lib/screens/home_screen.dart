import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_with_hive/widgets&colors/screen_components.dart';
import '../student/student_controller.dart';

class StudentListScreen extends GetView<StudentController> {
  StudentListScreen({Key? key}) : super(key: key);

  final StudentController sc = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBodyPart(),
    );
  }

  Padding _buildBodyPart() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: _buildStudentListContainer(),
      ),
    );
  }

  Container _buildStudentListContainer() {
    return Container(
      padding: const EdgeInsets.only(left: 15.0),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black),
      ),
      height: Get.height * 0.85,
      width: Get.width * 0.90,
      child: _buildStudentListView(),
    );
  }

  Obx _buildStudentListView() {
    return Obx(
      () => ListView.builder(
        itemCount: controller.studentList.length,
        itemBuilder: (context, index) {
          var student = controller.studentList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 20.0),
            child: Card(
              elevation: 2.0,
              clipBehavior: Clip.hardEdge,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.all(5.0),
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            child: Text(
                                student.name.substring(0, 1).toUpperCase()),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${student.name}',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              'Roll No: ${student.rollNo}', // Display additional student data
                              style: const TextStyle(
                                  fontSize: 14.0, color: Colors.grey),
                            ),
                            Text(
                              'Age: ${student.age}', // Display additional student data
                              style: const TextStyle(
                                  fontSize: 14.0, color: Colors.grey),
                            ),
                            Text(
                              'Phone: ${student.phoneNo}', // Display additional student data
                              style: const TextStyle(
                                  fontSize: 14.0, color: Colors.grey),
                            ),
                            Text(
                              "Gender: ${gender(student.isMale)}", // Display additional student data
                              style: const TextStyle(
                                  fontSize: 14.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            sc.isEditMode(true);
                            sc.selectedIndex = index;
                            sc.preFillValue(sc.studentList[index]);
                            Get.toNamed('/add_student', arguments: sc.studentList[index]);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            showDeleteDialog(index);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String gender(bool? isMale) {
    return isMale! ? 'Male' : 'Female';
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('Student Details'),
      actions: [
        IconButton(
          onPressed: () {
            sc.clearControllers();
            sc.isEditMode(false);
            Get.toNamed('/add_student');
          },
          tooltip: 'Add Student',
          icon: Icon(
            Icons.add_rounded,
            size: 30,
          ),
        ),
      ],
    );
  }
}
