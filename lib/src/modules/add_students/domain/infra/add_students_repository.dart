import '../../models/add_student_model.dart';

abstract interface class AddStudentRepository {
  Future<void> addStudent(AddStudentModel model);
}