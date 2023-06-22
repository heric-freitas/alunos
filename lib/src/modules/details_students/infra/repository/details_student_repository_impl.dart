import 'package:alunos/src/modules/details_students/models/details_student_model.dart';

import '../../domain/infra/details_student_repository.dart';
import '../datasource/details_student_datasource.dart';

class DetailsStudentRepositoryImpl implements DetailsStudentRepository {
  final DetailsStudentDatasource datasource;
  DetailsStudentRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<List<DetailsStudentModel>> getStudentById(int id) async {
    try {
      final result = await datasource.getStudentById(id);
      return result.map((e) => DetailsStudentModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteStudentById(int id) async {
    try {
      return await datasource.deleteStudentById(id);
    } catch (e) {
      throw Exception(e);
    }
  }
  
  @override
  Future<void> editStudent(DetailsStudentModel model) async {
    try {
      return await datasource.editStudent(model);
    } catch (e) {
      throw Exception(e);
    }
  }
}
