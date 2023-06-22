// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'details_student_cubit.dart';

enum DetailsStudentStatus {
  initial,
  loading,
  success,
  successDelete,
  successEdit,
  failure,
}

class DetailsStudentState extends Equatable {
  final DetailsStudentStatus status;
  final DetailsStudentModel detailsStudentModel;

  const DetailsStudentState({
    required this.status,
    required this.detailsStudentModel,
  });
  

  @override
  List<Object> get props => [status, detailsStudentModel];

  DetailsStudentState copyWith({
    DetailsStudentStatus? status,
    DetailsStudentModel? detailsStudentModel,
  }) {
    return DetailsStudentState(
      status: status ?? this.status,
      detailsStudentModel: detailsStudentModel ?? this.detailsStudentModel,
    );
  }
}
