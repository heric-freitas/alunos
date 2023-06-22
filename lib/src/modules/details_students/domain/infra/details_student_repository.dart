import 'package:alunos/src/modules/details_students/models/details_student_model.dart';

abstract interface class DetailsStudentRepository {
  Future<List<DetailsStudentModel>> getStudentById(int id);
  Future<void> deleteStudentById(int id);
  Future<void> editStudent(DetailsStudentModel model);
}