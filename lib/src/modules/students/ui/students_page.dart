import 'package:alunos/src/core/styles/app_color.dart';
import 'package:alunos/src/core/styles/app_text_styles.dart';

import '../../../core/helper/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/database/database.dart';
import '../presenter/cubit/students_cubit.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  late final StudentsCubit controller;
  Future<void> _goToAddStudents() async {
    await context.pushNamedAdd();
    controller.getStudentsLocal();
  }

  Future<void> _goToEditStudents(int id) async {
    await context.pushNamedDetails(id);
    controller.getStudentsLocal();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await openConnection();
      controller = context.read();
      controller.getStudentsLocal();
    });
  }

  Future<void> openConnection() async {
    await DatabaseSqfLite.instance.openConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos'),
        actions: [
          IconButton(
            onPressed: _goToAddStudents,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<StudentsCubit, StudentsState>(
        builder: (_, state) => Center(
          child: switch (state.status) {
            StudentsStatus.failure => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Aconteceu algo de errado', style: context.appTextStyles.subtitle1,),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Tente novamente'),
                  )
                ],
              ),
            StudentsStatus.initial => const Center(
                child: CircularProgressIndicator(),
              ),
            StudentsStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),
            StudentsStatus.success => ListView.builder(
                itemCount: state.listStudents.length,
                itemBuilder: (context, index) {
                  final student = state.listStudents[index];
                  return ListTile(
                    title: Text(student.name, style: context.appTextStyles.subtitle1,),
                    subtitle: Text(student.email, style: context.appTextStyles.subtitle2,),
                    leading: Icon(Icons.edit, color: context.appColor.white,),
                    trailing:
                        student.situation ? Text('Ativo', style: context.appTextStyles.subtitle1,) : Text('Inativo', style: context.appTextStyles.subtitle1,),
                    onTap: () => _goToEditStudents(student.id),
                  );
                },
              )
          },
        ),
      ),
    );
  }
}
