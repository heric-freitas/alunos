// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_students_cubit.dart';

enum AddStudentsStatus {
  initial,
  loading,
  success,
  failure,
}

class AddStudentsState extends Equatable {
  final AddStudentsStatus status;
  final AddStudentModel addStudentModel;

  const AddStudentsState({
    required this.status,
    required this.addStudentModel,
  });
  

  @override
  List<Object> get props => [status, addStudentModel];

  AddStudentsState copyWith({
    AddStudentsStatus? status,
    AddStudentModel? addStudentModel,
  }) {
    return AddStudentsState(
      status: status ?? this.status,
      addStudentModel: addStudentModel ?? this.addStudentModel,
    );
  }
}
