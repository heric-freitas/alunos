// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alunos/src/modules/details_students/models/details_student_model.dart';

import '../../presenter/usecases/get_student_by_id.dart';
import '../infra/details_student_repository.dart';

class GetStudentByIdImpl implements GetStudentById {
  final DetailsStudentRepository repository;
  GetStudentByIdImpl({
    required this.repository,
  });
  @override
  Future<List<DetailsStudentModel>> call(int id) async {
    try {
      return await repository.getStudentById(id);
    } catch (e) {
      throw Exception(e);
    }
  }

}
