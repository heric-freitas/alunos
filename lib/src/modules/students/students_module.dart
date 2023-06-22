import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../core/database/database.dart';
import 'data/datasource/students_datasource_impl.dart';
import 'domain/infra/students_repository.dart';
import 'domain/usecases/get_students_impl.dart';
import 'infra/datasource/students_datasource.dart';
import 'infra/repository/students_repository_impl.dart';
import 'presenter/cubit/students_cubit.dart';
import 'presenter/usecases/get_students.dart';
import 'ui/students_page.dart';

class StudentsModule extends StatelessWidget {
  const StudentsModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider<StudentsDatasource>(
          create: (context) => StudentsDatasourceImpl(
            databaseSqfLite: DatabaseSqfLite.instance,
          ),
        ),
        RepositoryProvider<StudentsRepository>(
          create: (context) => StudentsRepositoryImpl(
            datasource: context.read(),
          ),
        ),
        RepositoryProvider<GetStudents>(
          create: (context) => GetStudentsImpl(
            repository: context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => StudentsCubit(getStudents: context.read()),
        )
      ],
      child: const StudentsPage(),
    );
  }
}
