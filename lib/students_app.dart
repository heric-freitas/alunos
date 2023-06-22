import 'package:alunos/src/modules/details_students/details_student_module.dart';
import 'package:flutter/material.dart';

import 'src/core/theme/app_theme.dart';
import 'src/modules/add_students/add_students_module.dart';
import 'src/modules/core/core_module.dart';
import 'src/modules/students/students_module.dart';

class StudentsApp extends StatelessWidget {
  const StudentsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CoreModule(
      child: MaterialApp(
        theme: AppTheme.theme,
        title: 'Alunos',
        initialRoute: '/',
        routes: {
          '/' :(context) => const StudentsModule(),
          '/add-student' : (context) => const AddStudentsModule(),
          '/details' : (context) => DetailsStudentModule(
            id: ModalRoute.of(context)!.settings.arguments as int,
          ),
        },
      ),
    );
  }
}
