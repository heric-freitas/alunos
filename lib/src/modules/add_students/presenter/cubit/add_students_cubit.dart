import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/add_student_model.dart';
import '../usecases/add_student.dart';

part 'add_students_state.dart';

class AddStudentsCubit extends Cubit<AddStudentsState> {
  final AddStudent addStudent;
  AddStudentsCubit({required this.addStudent})
      : super(AddStudentsState(
          status: AddStudentsStatus.initial,
          addStudentModel: AddStudentModel(
              email: '',
              name: '',
              observation: '',
              phone: '',
              situation: false,
              monthlyPayment: ''),
        ));

  void updateAddStudentsModel({
    required String name,
    required String email,
    required String phone,
    required String monthlyPayment,
    required String observation,
  }) {
    emit(state.copyWith(
        addStudentModel: state.addStudentModel.copyWith(
      name: name,
      email: email,
      phone: phone,
      monthlyPayment: monthlyPayment,
      observation: observation,
    )));
  }

  void onChangedSituation({required bool situation}) {
    emit(state.copyWith(
        addStudentModel: state.addStudentModel.copyWith(situation: situation)));
  }

  Future<void> save() async {
    try {
      emit(state.copyWith(status: AddStudentsStatus.loading));
      await addStudent(state.addStudentModel);
      emit(state.copyWith(status: AddStudentsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddStudentsStatus.failure));
    }
  }
}
