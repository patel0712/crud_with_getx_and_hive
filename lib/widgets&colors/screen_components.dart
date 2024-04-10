import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../student/student_controller.dart';

final StudentController sc = Get.find();

void showSnackbar(String message) {
  Get.showSnackbar(
    GetSnackBar(
      margin: const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
      message: message,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 50.0,
      duration: const Duration(seconds: 2),
    ),
  );
}

void showDeleteDialog(int index) {
    Get.dialog(
      AlertDialog(
        title: Text('Delete Student'),
        content: const Text('Are you sure you want to delete student?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              sc.selectedIndex = index;
              Get.back();
              sc.deleteStudent();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }


