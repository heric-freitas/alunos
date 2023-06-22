import 'package:alunos/src/modules/details_students/presenter/usecases/delete_student_by_id.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/details_student_model.dart';
import '../usecases/edit_student.dart';
import '../usecases/get_student_by_id.dart';

part 'details_student_state.dart';

class DetailsStudentCubit extends Cubit<DetailsStudentState> {
  final GetStudentById getStudentById;
  final EditStudent editStudent;
  final DeleteStudentById deleteStudentById;
  DetailsStudentCubit(
      {required this.getStudentById,
      required this.deleteStudentById,
      required this.editStudent})
      : super(DetailsStudentState(
            status: DetailsStudentStatus.initial,
            detailsStudentModel: DetailsStudentModel(
              email: '',
              monthlyPayment: '',
              name: '',
              observation: '',
              phone: '',
              situation: false,
            )));

  void updateStudentsModel({
    required String name,
    required String email,
    required String phone,
    required String monthlyPayment,
    required String observation,
    required int id,
  }) {
    emit(state.copyWith(
        detailsStudentModel: state.detailsStudentModel.copyWith(
      name: name,
      email: email,
      phone: phone,
      monthlyPayment: monthlyPayment,
      observation: observation,
      id: id,
    )));
  }

  void onChangedSituation({required bool situation}) {
    emit(state.copyWith(
        detailsStudentModel:
            state.detailsStudentModel.copyWith(situation: situation)));
  }

  Future<void> save() async {
    try {
      emit(state.copyWith(status: DetailsStudentStatus.loading));
      await editStudent(state.detailsStudentModel);
      emit(state.copyWith(status: DetailsStudentStatus.successEdit));
    } catch (e) {
      emit(state.copyWith(status: DetailsStudentStatus.failure));
    }
  }

  Future<void> delete(int id) async {
    try {
      emit(state.copyWith(status: DetailsStudentStatus.loading));
      await deleteStudentById(id);
      emit(state.copyWith(status: DetailsStudentStatus.successDelete));
    } catch (e) {
      emit(state.copyWith(status: DetailsStudentStatus.failure));
    }
  }

  Future<void> getStudent(int id) async {
    try {
      emit(state.copyWith(status: DetailsStudentStatus.loading));
      final result = await getStudentById(id);
      emit(state.copyWith(
          status: DetailsStudentStatus.success,
          detailsStudentModel: result.first));
    } catch (e) {
      emit(state.copyWith(status: DetailsStudentStatus.failure));
    }
  }
}
