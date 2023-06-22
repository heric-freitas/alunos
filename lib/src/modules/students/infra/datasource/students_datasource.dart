abstract interface class StudentsDatasource {
  Future<List<Map<String, Object?>>> getStudents();
}