// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alunos/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SwitchStudent extends StatefulWidget {
  final bool initialValue;
  final void Function(bool value) onChanged;

  const SwitchStudent({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SwitchStudent> createState() => _SwitchStudentState();
}

class _SwitchStudentState extends State<SwitchStudent> {
  late bool valueSwitch;

  @override
  void initState() {
    super.initState();
    valueSwitch = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Situação:', style: context.appTextStyles.subtitle1),
        Switch(
          value: valueSwitch,
          onChanged: (value) {
            setState(() {
              valueSwitch = value;
            });
            widget.onChanged(value);
          },
        ),
        Text(valueSwitch ? 'Ativo' : 'Inativo', style: context.appTextStyles.subtitle1),
      ],
    );
  }
}
