import '../../models/students_model.dart';

abstract interface class StudentsRepository{
  Future<List<StudentsModel>> getStudents();
}