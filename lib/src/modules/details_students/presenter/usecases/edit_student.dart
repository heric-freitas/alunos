import '../../models/details_student_model.dart';

abstract interface class EditStudent {
  Future<void> call(DetailsStudentModel model);
}