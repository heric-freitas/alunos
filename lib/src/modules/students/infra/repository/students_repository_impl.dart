// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alunos/src/modules/students/domain/infra/students_repository.dart';
import 'package:alunos/src/modules/students/models/students_model.dart';

import '../datasource/students_datasource.dart';

class StudentsRepositoryImpl implements StudentsRepository {
  final StudentsDatasource datasource;
  StudentsRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<List<StudentsModel>> getStudents() async {
    try {
      final result = await datasource.getStudents();
      return result.map((e) => StudentsModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception();
    }
  }
}
