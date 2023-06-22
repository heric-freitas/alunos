import '../../models/students_model.dart';

abstract interface class GetStudents {
  Future<List<StudentsModel>> call();
}