import 'package:alunos/src/modules/details_students/models/details_student_model.dart';

abstract interface class GetStudentById {
 Future<List<DetailsStudentModel>> call(int id);
}