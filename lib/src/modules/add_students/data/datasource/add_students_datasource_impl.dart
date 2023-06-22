// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/database/database.dart';
import '../../infra/datasource/add_students_datasource.dart';
import '../../models/add_student_model.dart';

class AddStudentsDatasourceImpl implements AddStudentsDatasource {
  final DatabaseSqfLite databaseSqfLite;
  AddStudentsDatasourceImpl({
    required this.databaseSqfLite,
  });
  @override
  Future<void> addStudent(AddStudentModel model) async {
    try {
      return await DatabaseSqfLite.instance.insertStudents(
        name: model.name,
        email: model.email,
        monthlyPayment: model.monthlyPayment,
        observation: model.observation,
        phone: model.phone,
        situation: model.situation
      );
    } catch (e) {
      throw Exception(e);
    }
  }
  
}
