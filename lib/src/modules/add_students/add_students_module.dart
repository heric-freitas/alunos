import 'presenter/usecases/add_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../core/database/database.dart';
import 'data/datasource/add_students_datasource_impl.dart';
import 'domain/infra/add_students_repository.dart';
import 'domain/usecases/add_student_impl.dart';
import 'infra/datasource/add_students_datasource.dart';
import 'infra/repository/add_students_repository_impl.dart';
import 'presenter/cubit/add_students_cubit.dart';
import 'ui/add_students_page.dart';

class AddStudentsModule extends StatelessWidget {
  const AddStudentsModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider<AddStudentsDatasource>(
          create: (context) => AddStudentsDatasourceImpl(
            databaseSqfLite: DatabaseSqfLite.instance,
          ),
        ),
        RepositoryProvider<AddStudentRepository>(
          create: (context) => AddStudentRepositoryImpl(
            datasource: context.read(),
          ),
        ),
        RepositoryProvider<AddStudent>(
          create: (context) => AddStudentImpl(repository: context.read()),
        ),
        BlocProvider(
          create: (context) => AddStudentsCubit(addStudent: context.read()),
        )
      ],
      child: const AddStudentsPage(),
    );
  }
}
