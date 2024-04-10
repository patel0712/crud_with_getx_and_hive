import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_with_hive/hive_model/student_model.dart';
import 'package:getx_student_with_hive/screens/add_student.dart';
import 'package:getx_student_with_hive/screens/home_screen.dart';
import 'package:getx_student_with_hive/student/student_binding.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!Hive.isBoxOpen('student')) {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(StudentAdapter());
    await Hive.openBox<Student>('student');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () =>  StudentListScreen(),
          binding: StudentBinding(),
        ),
        GetPage(
          name: '/add_student',
          page: () => AddStudent(),
          binding: StudentBinding(),
        ), 
      ],
      home:  StudentListScreen(),
    );
  }
}
