// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/students_model.dart';
import '../usecases/get_students.dart';

part 'students_state.dart';

class StudentsCubit extends Cubit<StudentsState> {
  final GetStudents getStudents;
  StudentsCubit({required this.getStudents})
      : super(const StudentsState(
          listStudents: [],
          status: StudentsStatus.initial,
        ));

  Future<void> getStudentsLocal() async {
    try {
      emit(state.copyWith(status: StudentsStatus.loading));
      final listStudents = await getStudents();
      emit(state.copyWith(
          listStudents: listStudents, status: StudentsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: StudentsStatus.failure));
    }
  }
}
