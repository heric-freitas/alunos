import 'package:alunos/src/core/helper/navigation/navigator.dart';
import 'package:alunos/src/modules/details_students/presenter/cubit/details_student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets/form_student.dart';
import '../../../core/widgets/switch_student.dart';

class DetailsStudentsPage extends StatefulWidget {
  final int id;
  const DetailsStudentsPage({super.key, required this.id});

  @override
  State<DetailsStudentsPage> createState() => _DetailsStudentsPageState();
}

class _DetailsStudentsPageState extends State<DetailsStudentsPage> {
  late final DetailsStudentCubit controller;
  final formKey = GlobalKey<FormState>();

  MoneyMaskedTextController moneyController = MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: 'R\$ ',
  );

  MaskedTextController controllerPhone = MaskedTextController(
    mask: '(00) 00000-0000',
  );
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerObservation = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller = context.read();
      await controller.getStudent(widget.id);
      moneyController.updateValue(double.parse(controller
          .state.detailsStudentModel.monthlyPayment
          .replaceAll('R\$ ', '')
          .replaceAll(',', '')
          .replaceAll('.', '')
          .replaceFirst('00', '')));
      controllerPhone.updateText(controller.state.detailsStudentModel.phone);
      controllerName.text = controller.state.detailsStudentModel.name;
      controllerEmail.text = controller.state.detailsStudentModel.email;
      controllerObservation.text =
          controller.state.detailsStudentModel.observation;
    });
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
        title: const Text('Detalhes'),
      ),
      body: BlocConsumer<DetailsStudentCubit, DetailsStudentState>(
        listener: (context, state) {
          if (state.status == DetailsStudentStatus.successEdit ||
              state.status == DetailsStudentStatus.successDelete) {
            context.pop();
          }
        },
        builder: (context, state) => switch (state.status) {
          DetailsStudentStatus.successDelete => Container(),
          DetailsStudentStatus.successEdit => Container(),
          DetailsStudentStatus.initial => const Center(
              child: CircularProgressIndicator(),
            ),
          DetailsStudentStatus.loading => const Center(
              child: CircularProgressIndicator(),
            ),
          DetailsStudentStatus.failure => Center(
              child: ElevatedButton(
                child: const Text('Tente Novamente'),
                onPressed: () async {
                  await controller.getStudentById(widget.id);
                },
              ),
            ),
          DetailsStudentStatus.success => SingleChildScrollView(
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
                        textInputType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                      FormStudent(
                        maxLength: 200,
                        hintText: 'Observação',
                        controller: controllerObservation,
                        textInputType: TextInputType.multiline,
                        maxLines: 5,
                      ),
                      SwitchStudent(
                        initialValue:
                            controller.state.detailsStudentModel.situation,
                        onChanged: (value) {
                          controller.onChangedSituation(situation: value);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.delete(widget.id);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text('Deletar'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                controller.updateStudentsModel(
                                    id: widget.id,
                                    name: controllerName.text,
                                    email: controllerEmail.text,
                                    phone: controllerPhone.text,
                                    monthlyPayment: moneyController.text,
                                    observation: controllerObservation.text);
                                controller.save();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            child: const Text('Editar'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
        },
      ),
    );
  }
}
