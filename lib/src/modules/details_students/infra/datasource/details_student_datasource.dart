import '../../models/details_student_model.dart';

abstract interface class DetailsStudentDatasource {
  Future<List<Map<String, Object?>>> getStudentById(int id);
  Future<void> deleteStudentById(int id);
  Future<void> editStudent(DetailsStudentModel model);
}