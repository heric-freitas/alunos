import '../../models/add_student_model.dart';

abstract interface class AddStudent {
  Future<void> call(AddStudentModel model);
}