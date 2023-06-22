// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:alunos/src/modules/students/infra/datasource/students_datasource.dart';

import '../../../../core/database/database.dart';

class StudentsDatasourceImpl implements StudentsDatasource {

  final DatabaseSqfLite databaseSqfLite;

  StudentsDatasourceImpl({
    required this.databaseSqfLite,
});

  @override
  Future<List<Map<String, Object?>>> getStudents() async {
    try {
      return await DatabaseSqfLite.instance.getStudets();
    } catch (e, s) {
      log('$s');
      throw Exception(e);
    }
  }
}
