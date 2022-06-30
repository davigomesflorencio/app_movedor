import 'package:aplicacao/src/controllers/questionarios_periodicos_controller.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/custom_buttom.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:aplicacao/src/views/pesquisas/questionario_periodico/steps/step_escala_dor.dart';
import 'package:aplicacao/src/views/pesquisas/questionario_periodico/steps/step_intro_roland_morris.dart';
import 'package:aplicacao/src/views/pesquisas/questionario_periodico/steps/step_questionario_crencas_costas.dart';
import 'package:aplicacao/src/views/pesquisas/questionario_periodico/steps/step_questionario_crencas_recuperacao_parte1.dart';
import 'package:aplicacao/src/views/pesquisas/questionario_periodico/steps/step_questionario_crencas_recuperacao_parte2.dart';
import 'package:aplicacao/src/views/pesquisas/questionario_periodico/steps/step_roland_morris.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionarioPeriodicoPage extends StatefulWidget {
  const QuestionarioPeriodicoPage({Key? key}) : super(key: key);

  @override
  State<QuestionarioPeriodicoPage> createState() =>
      _QuestionarioPeriodicoPageState();
}

class _QuestionarioPeriodicoPageState extends State<QuestionarioPeriodicoPage> {
  QuestionariosPeriodicosController controller = Get.find();

  int _stepSelecionado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questionário"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: StepperType.horizontal,
                currentStep: _stepSelecionado,
                controlsBuilder: (context, controls) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            child: Center(
                              child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ButtomWidget(
                                    texto: "Voltar",
                                    onPress: cancel,
                                    textColor: CoresMovedor.textoBotaoCor,
                                    botaoColor: CoresMovedor.primary,
                                    habilitarBotao: true),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            child: Center(
                              child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ButtomWidget(
                                    texto: "Continuar",
                                    onPress: continued,
                                    textColor: CoresMovedor.textoBotaoCor,
                                    botaoColor: CoresMovedor.primary,
                                    habilitarBotao: true),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                steps: [
                  //0 - StepEscalaDeDor
                  Step(
                    content: const StepEscalaDeDor(),
                    isActive: _stepSelecionado >= 0,
                    state: _stepSelecionado > 0
                        ? StepState.complete
                        : _stepSelecionado == 0
                            ? StepState.editing
                            : StepState.disabled,
                    title: _stepSelecionado == 0
                        ? const Text("Etapa 1")
                        : const Text(""),
                  ),

                  //1 - QuestionarioCrencasCostas
                  Step(
                    content: const StepQuestionarioCrencasCostas(),
                    isActive: _stepSelecionado >= 1,
                    state: _stepSelecionado > 1
                        ? StepState.complete
                        : _stepSelecionado == 1
                            ? StepState.editing
                            : StepState.disabled,
                    title: _stepSelecionado == 1
                        ? const Text("Etapa 2")
                        : const Text(""),
                  ),
                  //2 - QuestionarioCrencasRecuperacao

                  Step(
                    content: const StepQuestionarioCrencasRecuperacaoParte1(),
                    isActive: _stepSelecionado >= 2,
                    state: _stepSelecionado > 2
                        ? StepState.complete
                        : _stepSelecionado == 2
                            ? StepState.editing
                            : StepState.disabled,
                    title: _stepSelecionado == 2
                        ? const Text("Etapa 3")
                        : const Text(""),
                  ),

                  Step(
                    content: const StepQuestionarioCrencasRecuperacaoParte2(),
                    isActive: _stepSelecionado >= 3,
                    state: _stepSelecionado > 3
                        ? StepState.complete
                        : _stepSelecionado == 3
                            ? StepState.editing
                            : StepState.disabled,
                    title: _stepSelecionado == 3
                        ? const Text("Etapa 3")
                        : const Text(""),
                  ),

                  // 3- Intro Roland Morris
                  Step(
                    content: const StepIntroducaoRolandMorris(),
                    isActive: _stepSelecionado >= 4,
                    state: _stepSelecionado > 4
                        ? StepState.complete
                        : _stepSelecionado == 4
                            ? StepState.editing
                            : StepState.disabled,
                    title: _stepSelecionado == 4
                        ? const Text("Etapa 4")
                        : const Text(""),
                  ),

                  //4 - RolandMorris
                  Step(
                    content: const StepRolandMorris(),
                    isActive: _stepSelecionado >= 5,
                    state: _stepSelecionado > 5
                        ? StepState.complete
                        : _stepSelecionado == 5
                            ? StepState.editing
                            : StepState.disabled,
                    title: _stepSelecionado == 5
                        ? const Text("Etapa 5")
                        : const Text(""),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  continued() {
    switch (_stepSelecionado) {
      case 0:
        setState(() {
          if (controller.tempoDeDor == 'menos de 3 meses') {
            showDialogConclusion(
              context,
              'Aviso',
              'Este aplicativo é destinado para pessoas que têm dor na parte inferior das costas por mais de 3 meses',
              () => Navigator.of(context).pop(),
            );
          } else {
            _stepSelecionado += 1;
          }
        });
        break;
      case 1:
        if (controller.validateQ1()) {
          setState(() {
            _stepSelecionado += 1;
          });
        } else {
          controller.clickValidate1.value = true;
        }
        break;
      case 2:
        if (controller.validateQ2Parte1()) {
          setState(() {
            _stepSelecionado += 1;
          });
        } else {
          controller.clickValidate2.value = true;
        }

        break;
      case 3:
        if (controller.validateQ2Parte2()) {
          setState(() {
            _stepSelecionado += 1;
          });
        } else {
          controller.clickValidate2.value = true;
        }

        break;
      case 4:
        setState(() {
          _stepSelecionado += 1;
        });
        break;
      case 5:
        showDialogConclusion(
          context,
          "Questionário mensal respondido!",
          "Parabéns! Você respondeu o questionário mensal.",
          popShowDialogConclusion,
        );
        break;
    }
  }

  cancel() {
    _stepSelecionado > 0 ? setState(() => _stepSelecionado -= 1) : null;
  }

  popShowDialogConclusion() {
    FocusScope.of(context).unfocus();
    controller.saveQuestionarioPeriodicos();
    controller.clearValueControllers();
    Get.offAllNamed('/home');
  }

  Future<dynamic> showDialogConclusion(
    BuildContext context,
    String title,
    String content,
    Function() func,
  ) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyleMovedor.secondTextStyleAzul,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            ButtomWidget(
                texto: "OK",
                onPress: func,
                textColor: CoresMovedor.textoBotaoCor,
                botaoColor: CoresMovedor.primary,
                habilitarBotao: true),
          ],
        ),
        actions: [],
      ),
    );
  }
}
