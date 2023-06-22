// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alunos/src/modules/add_students/domain/infra/add_students_repository.dart';
import 'package:alunos/src/modules/add_students/models/add_student_model.dart';

import '../../presenter/usecases/add_student.dart';

class AddStudentImpl implements AddStudent {
  final AddStudentRepository repository;

  AddStudentImpl({
    required this.repository,
  });
  @override
  Future<void> call(AddStudentModel model) async {
    try {
      return await repository.addStudent(model);
    } catch (e) {
      throw Exception(e);
    }
  }
}
