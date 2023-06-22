import 'package:alunos/src/modules/details_students/presenter/usecases/delete_student_by_id.dart';
import 'package:alunos/src/modules/details_students/presenter/usecases/edit_student.dart';
import 'package:alunos/src/modules/details_students/presenter/usecases/get_student_by_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../core/database/database.dart';
import 'data/datasource/details_student_datasource_impl.dart';
import 'domain/infra/details_student_repository.dart';
import 'domain/usecases/delete_student_by_id_impl.dart';
import 'domain/usecases/edit_student_impl.dart';
import 'domain/usecases/get_student_by_id_impl.dart';
import 'infra/datasource/details_student_datasource.dart';
import 'infra/repository/details_student_repository_impl.dart';
import 'presenter/cubit/details_student_cubit.dart';
import 'ui/details_students_page.dart';

class DetailsStudentModule extends StatelessWidget {
  final int id;
  const DetailsStudentModule({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider<DetailsStudentDatasource>(
          create: (context) => DetailsStudentDatasourceImpl(
            databaseSqfLite: DatabaseSqfLite.instance,
          ),
        ),
        RepositoryProvider<DetailsStudentRepository>(
          create: (context) => DetailsStudentRepositoryImpl(
            datasource: context.read(),
          ),
        ),
        RepositoryProvider<GetStudentById>(
          create: (context) => GetStudentByIdImpl(
            repository: context.read(),
          ),
        ),
        RepositoryProvider<DeleteStudentById>(
          create: (context) => DeleteStudentByIdImpl(
            repository: context.read(),
          ),
        ),
        RepositoryProvider<EditStudent>(
          create: (context) => EditStudentImpl(
            repository: context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => DetailsStudentCubit(
            getStudentById: context.read(),
            deleteStudentById: context.read(),
            editStudent: context.read(),
          ),
        )
      ],
      child: DetailsStudentsPage(id: id),
    );
  }
}
