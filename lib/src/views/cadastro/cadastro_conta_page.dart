import 'dart:async';

import 'package:aplicacao/src/controllers/cadastro_controller.dart';
import 'package:aplicacao/src/util/constantes_dialog.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_ativ_fisicas.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_cadastro_inicial.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_dados_pessoais.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_regiao_dor.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_sintomas.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/custom_buttom.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class CadastroContaPage extends StatefulWidget {
  const CadastroContaPage({Key? key}) : super(key: key);

  @override
  _CadastroContaPageState createState() => _CadastroContaPageState();
}

class _CadastroContaPageState extends State<CadastroContaPage> {
  int _stepSelecionado = 0;
  var controller = CadastroController.instance;

  @override
  void dispose() {
    controller.limparValoresDoController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro",
          style: TextStyleMovedor.appBar,
        ),
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
                                    texto: "Continuar",
                                    onPress: continued,
                                    textColor: CoresMovedor.textoBotaoCor,
                                    botaoColor: CoresMovedor.primary,
                                    habilitarBotao: true),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                steps: [
                  //1 - StepCadastroInicial(),
                  Step(
                    content: StepCadastroInicial(),
                    state: _stepSelecionado > 0
                        ? StepState.complete
                        : _stepSelecionado == 0
                            ? StepState.editing
                            : StepState.disabled,
                    isActive: _stepSelecionado >= 0,
                    title: _stepSelecionado == 0
                        ? const Text("Etapa 1")
                        : const Text(""),
                  ),
                  //2 - StepDadosPessoais(),
                  Step(
                    content: const StepDadosPessoais(),
                    state: _stepSelecionado > 1
                        ? StepState.complete
                        : _stepSelecionado == 1
                            ? StepState.editing
                            : StepState.disabled,
                    isActive: _stepSelecionado >= 1,
                    title: _stepSelecionado == 1
                        ? const Text("Etapa 2")
                        : const Text(""),
                  ),

                  //3 - StepRegiaoDor(),
                  Step(
                    content: const StepRegiaoDor(),
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
                  //4 - StepSintomas
                  Step(
                    content: const StepSintomas(),
                    isActive: _stepSelecionado >= 3,
                    state: _stepSelecionado > 3
                        ? StepState.complete
                        : _stepSelecionado == 3
                            ? StepState.editing
                            : StepState.disabled,
                    title: _stepSelecionado == 3
                        ? const Text("Etapa 4")
                        : const Text(""),
                  ),
                  //5 - StepAtividades
                  Step(
                    content: const StepAtividadesFisicas(),
                    isActive: _stepSelecionado >= 4,
                    state: _stepSelecionado > 4
                        ? StepState.complete
                        : _stepSelecionado == 4
                            ? StepState.editing
                            : StepState.disabled,
                    title: _stepSelecionado == 4
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
    setState(() {
      if (_stepSelecionado != 4) {
        FocusScope.of(context).unfocus();
        switch (_stepSelecionado) {
          case 0:
            if (controller.formKey.currentState!.validate()) {
              _stepSelecionado += 1;
            }
            break;
          case 1:
            if (controller.formKeyDadosUsuario.currentState!.validate()) {
              _stepSelecionado += 1;
            }
            break;
          case 2:
            int _infoSenteDor = controller.senteDorController;
            int _infoRegiaoDor = controller.regiaoDaDorController;
            if (_infoSenteDor != 0 || _infoRegiaoDor != 0) {
              showDialogConclusion(
                context,
                ConstantesDialogs.TITLE_AVISO,
                ConstantesDialogs.SUBTITLE_VC_NAO_PODE_CONTINUAR,
                popShowDialog,
              );
            } else {
              _stepSelecionado += 1;
            }

            break;
          case 3:
            int countTrue = 0;
            for (var i = 1;
                i < CadastroController.instance.listSintomas.length;
                i++) {
              if (CadastroController.instance.listSintomas[i].check == true) {
                countTrue = 1;
              }
            }
            if (countTrue == 1) {
              showDialogConclusion(
                context,
                ConstantesDialogs.TITLE_AVISO,
                ConstantesDialogs.SUBTITLE_MAIS_DE_TRES_VALORES_MARCADOS,
                abrirMapaUbsMaisProxima,
              );
            } else {
              _stepSelecionado += 1;
            }
            break;
        }
      } else {
        showDialogConclusion(
          context,
          ConstantesDialogs.TITLE_PRIMEIRA_ETAPA_CONCLUIDA,
          ConstantesDialogs.SUBTITLE_PRIMEIRA_ETAPA_CONCLUIDA,
          popShowDialogConclusion,
        );
      }
    });
  }

  abrirMapaUbsMaisProxima() async =>
      await MapsLauncher.launchQuery('UBS próxima a mim');

  cancel() {
    _stepSelecionado > 0 ? setState(() => _stepSelecionado -= 1) : null;
  }

  popShowDialog() {
    Navigator.of(context).pop();
  }

  popShowDialogConclusion() {
    FocusScope.of(context).unfocus();
    controller.criarConta(context);
  }

  Future<dynamic> showDialogConclusion(BuildContext context, String title,
      String content, Function() func) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
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
                texto: "Continuar",
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
