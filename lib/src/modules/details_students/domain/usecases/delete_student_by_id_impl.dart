import '../../presenter/usecases/delete_student_by_id.dart';
import '../infra/details_student_repository.dart';

class DeleteStudentByIdImpl implements DeleteStudentById {
  final DetailsStudentRepository repository;
  DeleteStudentByIdImpl({
    required this.repository,
  });
  @override
  Future<void> call(int id) async {
    try {
      return await repository.deleteStudentById(id);
    } catch (e) {
      throw Exception(e);
    }
  }

}
