// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alunos/src/modules/details_students/models/details_student_model.dart';

import '../../../../core/database/database.dart';
import '../../infra/datasource/details_student_datasource.dart';

class DetailsStudentDatasourceImpl implements DetailsStudentDatasource {
  final DatabaseSqfLite databaseSqfLite;
  DetailsStudentDatasourceImpl({
    required this.databaseSqfLite,
  });
  @override
  Future<List<Map<String, Object?>>> getStudentById(int id) async {
    try {
      return await databaseSqfLite.getStudetById(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteStudentById(int id) async {
    try {
      return await databaseSqfLite.deleteStudents(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> editStudent(DetailsStudentModel model) async {
    try {
      return await databaseSqfLite.updateStudents(
          id: model.id!,
          name: model.name,
          email: model.email,
          phone: model.phone,
          situation: model.situation,
          observation: model.observation,
          monthlyPayment: model.monthlyPayment);
    } catch (e) {
      throw Exception(e);
    }
  }
}
