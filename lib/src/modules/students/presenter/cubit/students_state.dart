// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'students_cubit.dart';

enum StudentsStatus {
  initial,
  loading,
  success,
  failure,
}

class StudentsState extends Equatable {
  final StudentsStatus status;
  final List<StudentsModel> listStudents;

  const StudentsState({
    required this.status,
    required this.listStudents,
  });

  @override
  List<Object> get props => [status, listStudents];

  StudentsState copyWith({
    StudentsStatus? status,
    List<StudentsModel>? listStudents,
  }) {
    return StudentsState(
      status: status ?? this.status,
      listStudents: listStudents ?? this.listStudents,
    );
  }
}
