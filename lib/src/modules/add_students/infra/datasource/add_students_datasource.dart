import '../../models/add_student_model.dart';

abstract interface class AddStudentsDatasource {
  Future<void> addStudent(AddStudentModel model);
}