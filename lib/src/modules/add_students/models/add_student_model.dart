// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:alunos/src/core/helper/helper_database/helper_database.dart';

class AddStudentModel {
  final String name;
  final String email;
  final String phone;
  final bool situation;
  final String observation;
  final String monthlyPayment;
  
  AddStudentModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.situation,
    required this.observation,
    required this.monthlyPayment,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'situation': situation.toInt(),
      'observation': observation,
      'monthly_payment' : monthlyPayment
    };
  }

  factory AddStudentModel.fromMap(Map<String, dynamic> map) {
    return AddStudentModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      situation: (map['situation'] as int).toBool(),
      monthlyPayment: map['monthly_payment'] as String,
      observation: map['observation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddStudentModel.fromJson(String source) => AddStudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  AddStudentModel copyWith({
    String? name,
    String? email,
    String? phone,
    bool? situation,
    String? observation,
    String? monthlyPayment,
  }) {
    return AddStudentModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      situation: situation ?? this.situation,
      observation: observation ?? this.observation,
      monthlyPayment: monthlyPayment ?? this.monthlyPayment
    );
  }

  @override
  String toString() {
    return 'AddStudentModel(name: $name, email: $email, phone: $phone, situation: $situation, observation: $observation, monthlyPayment: $monthlyPayment)';
  }
}
