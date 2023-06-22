// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../core/helper/helper_database/helper_database.dart';

class DetailsStudentModel {
  final int? id;
  final String name;
  final String email;
  final String phone;
  final bool situation;
  final String observation;
  final String monthlyPayment;
  
  DetailsStudentModel({
    this.id,
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
      'monthly_payment' : monthlyPayment,
    };
  }

  factory DetailsStudentModel.fromMap(Map<String, dynamic> map) {
    return DetailsStudentModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      situation: (map['situation'] as int).toBool(),
      monthlyPayment: map['monthly_payment'] as String,
      observation: map['observation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsStudentModel.fromJson(String source) => DetailsStudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  DetailsStudentModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    bool? situation,
    String? observation,
    String? monthlyPayment,
  }) {
    return DetailsStudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      situation: situation ?? this.situation,
      observation: observation ?? this.observation,
      monthlyPayment: monthlyPayment ?? this.monthlyPayment,
    );
  }
}
