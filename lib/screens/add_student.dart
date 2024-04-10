// add_student.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_with_hive/student/student_controller.dart';
import '../hive_model/student_model.dart';
import '../widgets&colors/common_app_input.dart';

class AddStudent extends StatelessWidget {
  AddStudent({Key? key}) : super(key: key);
  final StudentController sc = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {

    

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(sc.isEditMode.value ? 'Edit Student' : 'Add Student'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonAppInput(
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  borderRadius: 10.0,
                  textEditingController: sc.nameController,
                  hintText: 'Enter your Name',
                ),
                SizedBox(height: 5.0),
                CommonAppInput(
                  textEditingController: sc.rollNoController,
                  maxLines: 1,
                  borderRadius: 10.0,
                  hintText: 'Enter Roll No.',
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 5.0),
                CommonAppInput(
                  textEditingController: sc.ageController,
                  maxLines: 1,
                  borderRadius: 10.0,
                  hintText: 'Age',
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 5.0),
                _buildGenderDropDown(),
                SizedBox(height: 5.0),
                CommonAppInput(
                  textEditingController: sc.phoneNoController,
                  borderRadius: 10.0,
                  hintText: '12345 67890',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(height: 5.0),
                CommonAppInput(
                  textEditingController: sc.addressController,
                  borderRadius: 10.0,
                  maxLines: 3,
                  hintText: 'Address',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 15.0),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildGenderDropDown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: DropdownButtonFormField<String>(
        value: sc.isMale.value ? 'Male' : 'Female',
        onChanged: (String? newValue) {
          if (newValue != null) {
            sc.isMale.value = newValue == 'Male';
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        items: <String>['Male', 'Female']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  ElevatedButton _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        final Student student = Student(
          name: sc.nameController.text,
          rollNo: int.tryParse(sc.rollNoController.text) ?? 0,
          age: int.tryParse(sc.ageController.text) ?? 0,
          phoneNo: int.tryParse(sc.phoneNoController.text) ?? 0,
          address: sc.addressController.text,
          isMale: sc.isMale.value,
        );
        sc.addOrUpdate(student);
        sc.getStudentList();
        Get.offAllNamed('/');
      },
      child: sc.isEditMode.value ? Text('Update'): Text('Add'),
    );
  }
}
