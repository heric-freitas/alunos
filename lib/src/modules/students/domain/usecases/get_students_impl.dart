// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alunos/src/modules/students/models/students_model.dart';
import 'package:alunos/src/modules/students/presenter/usecases/get_students.dart';

import '../infra/students_repository.dart';

class GetStudentsImpl implements GetStudents {
  final StudentsRepository repository;

  GetStudentsImpl({
    required this.repository,
  });
  
  @override
  Future<List<StudentsModel>> call() async {
    try {
      return await repository.getStudents();
    } catch (e) {
      throw Exception();
    }
  }

}
