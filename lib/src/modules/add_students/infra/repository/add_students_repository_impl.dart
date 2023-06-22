// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../domain/infra/add_students_repository.dart';
import '../../models/add_student_model.dart';
import '../datasource/add_students_datasource.dart';

class AddStudentRepositoryImpl implements AddStudentRepository {
  final AddStudentsDatasource datasource;
  AddStudentRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<void> addStudent(AddStudentModel model) async {
    try {
      return await datasource.addStudent(model);
    } catch (e) {
      throw Exception(e);
    }
  }
}
