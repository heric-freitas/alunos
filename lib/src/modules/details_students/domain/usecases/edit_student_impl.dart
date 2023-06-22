// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alunos/src/modules/details_students/models/details_student_model.dart';

import '../../presenter/usecases/edit_student.dart';
import '../infra/details_student_repository.dart';

class EditStudentImpl implements EditStudent {
  final DetailsStudentRepository repository;
  EditStudentImpl({
    required this.repository,
  });
  @override
  Future<void> call(DetailsStudentModel model)  async {
    try {
      return await repository.editStudent(model);
    } catch (e) {
      throw Exception(e);
    }
  }
}
