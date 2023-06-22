// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormStudent extends StatelessWidget {
  final String hintText;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final String? initialValue;
  const FormStudent({
    Key? key,
    required this.hintText,
    this.textInputType,
    this.maxLines = 1,
    this.maxLength,
    this.controller,
    this.inputFormatters,
    this.validator, this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        maxLength: maxLength,
        keyboardType: textInputType,
        validator: validator,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          counterText: '',
          hintText: hintText,
          isDense: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
