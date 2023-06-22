import 'dart:convert';

import '../../../core/helper/helper_database/helper_database.dart';

class StudentsModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final bool situation;
  final String observation;
  final String monthlyPayment;
  
  StudentsModel({
    required this.id,
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

  factory StudentsModel.fromMap(Map<String, dynamic> map) {
    return StudentsModel(
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

  factory StudentsModel.fromJson(String source) => StudentsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
