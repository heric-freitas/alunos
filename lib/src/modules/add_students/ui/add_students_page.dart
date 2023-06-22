import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/helper/navigation/navigator.dart';
import '../../../core/widgets/form_student.dart';
import '../../../core/widgets/switch_student.dart';
import '../presenter/cubit/add_students_cubit.dart';

class AddStudentsPage extends StatefulWidget {
  const AddStudentsPage({super.key});

  @override
  State<AddStudentsPage> createState() => _AddStudentsPageState();
}

class _AddStudentsPageState extends State<AddStudentsPage> {
  late final AddStudentsCubit controller;
  final formKey = GlobalKey<FormState>();

  final moneyController = MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: 'R\$ ',
  );

  final controllerPhone = MaskedTextController(mask: '(00) 00000-0000');
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerObservation = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = context.read();
  }

  @override
  void dispose() {
    moneyController.dispose();
    controllerPhone.dispose();
    controllerName.dispose();
    controllerEmail.dispose();
    controllerObservation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar novo aluno'),
      ),
      body: BlocListener<AddStudentsCubit, AddStudentsState>(
        listener: (context, state) {
          if (state.status == AddStudentsStatus.success) {
            context.pop();
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormStudent(
                    controller: controllerName,
                    maxLength: 200,
                    textInputType: TextInputType.name,
                    hintText: 'Nome do aluno',
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatorio'),
                      Validatorless.min(3, 'Minimo de 3 caracteres')
                    ]),
                  ),
                  FormStudent(
                    controller: controllerEmail,
                    maxLength: 200,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Email do aluno',
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatorio'),
                      Validatorless.email('Email invalido')
                    ]),
                  ),
                  FormStudent(
                    maxLength: 15,
                    controller: controllerPhone,
                    textInputType: TextInputType.phone,
                    hintText: 'Telefone',
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatorio'),
                      Validatorless.between(14, 15, 'Telefone invalido')
                    ]),
                  ),
                  FormStudent(
                    maxLength: 15,
                    hintText: 'Mensalidade',
                    controller: moneyController,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                  FormStudent(
                    maxLength: 200,
                    hintText: 'Observação',
                    controller: controllerObservation,
                    textInputType: TextInputType.multiline,
                    maxLines: 5,
                  ),
                  SwitchStudent(
                    initialValue: controller.state.addStudentModel.situation,
                    onChanged: (value) {
                      controller.onChangedSituation(situation: value);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        controller.updateAddStudentsModel(
                            name: controllerName.text,
                            email: controllerEmail.text,
                            phone: controllerPhone.text,
                            monthlyPayment: moneyController.text,
                            observation: controllerObservation.text);
                        controller.save();
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Cadastrar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
