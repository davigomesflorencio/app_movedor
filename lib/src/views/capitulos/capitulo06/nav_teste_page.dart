import 'package:aplicacao/src/controllers/pesquisas_controller.dart';
import 'package:aplicacao/src/views/capitulos/capitulo06/step_Q1.dart';
import 'package:aplicacao/src/views/capitulos/capitulo06/step_Q2.dart';
import 'package:aplicacao/src/views/capitulos/capitulo06/step_Q3.dart';
import 'package:aplicacao/src/views/capitulos/capitulo06/step_Q4.dart';
import 'package:aplicacao/src/views/capitulos/capitulo06/step_Q5.dart';
import 'package:aplicacao/src/views/capitulos/capitulo06/step_Q6.dart';
import 'package:aplicacao/src/views/capitulos/capitulo06/step_Q7.dart';
import 'package:aplicacao/src/views/capitulos/capitulo06/step_Q8.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:aplicacao/src/views/pesquisas/finalizacao/finalizacao_testes_page.dart';
import 'package:flutter/material.dart';
import 'package:aplicacao/src/views/components/custom_buttom.dart';
import 'package:get/get.dart';

class NavegacaoTestStepsPage extends StatefulWidget {
  const NavegacaoTestStepsPage({Key? key}) : super(key: key);

  @override
  _NavegacaoTestStepsPageState createState() => _NavegacaoTestStepsPageState();
}

class _NavegacaoTestStepsPageState extends State<NavegacaoTestStepsPage> {
  final _formKey = GlobalKey<FormState>();
  int _stepSelecionado = 0;
  int _acertos = 0;
  List<String> correctAnswers = [
    'A maioria das pessoas com Dor Lombar Crônica não precisa de exames de imagem para definir um tratamento ou desfecho. É comum ter degenerações ou lesões nos tecidos do corpo e não sentir dor. Portanto, não é possível afirmar que a hérnia de disco encontrada no exame é a causa da sua dor nas costas, a não ser que você possua sintomas como febre, perda de peso não intencional, diminuição de força muscular nas pernas, perda de sensibilidade progressiva, dores constantes, ou tenha passado por eventos traumáticos graves',
    'Na grande maioria dos casos, a DL não é uma condição grave de saúde. Procure sua equipe de saúde para uma melhor avaliação caso identifique: febre, perda de peso não intencional, diminuição de força muscular nas pernas, perda de sensibilidade progressiva, dores constantes, ou tenha passado por eventos traumáticos graves. Saiba que estes sinais são raros!',
    'A dor lombar é uma queixa comum! Em torno de 84% da população brasileira irá sentir a DL em algum momento da vida.',
    'A dor pode acontecer durante a atividade, mas não deve se manter nem aumentar após sua conclusão. Ao se sentir seguro, progrida aos poucos, até ganhar confiança para fazer o movimento livremente.',
    'Ficar apenas em repouso ou receber tratamentos passivos não irão melhorar a sua dor. Viver em movimento sim! Na verdade, o movimento é um dos maiores aliados no tratamento da dor lombar!',
    'A caminhada é um exercício simples, gratuito, de baixo impacto físico e com ganhos importantes para pessoas com dor crônica. Você nunca caminhou ou não faz nenhum exercício físico? Comece caminhando 10 minutos. Aumente esse tempo aos poucos com o passar das semanas, de acordo com seus limites.',
    'Você não precisa iniciar pelo movimento mais desafiador! Procure por movimentos mais fáceis e simples, sempre respeitando os limites do seu corpo e, conforme for se sentindo seguro(a), progrida aos poucos, até ganhar mais confiança!',
    'Exercícios que lhe ajudam a relaxar o corpo e a mente são ótimos aliados no alívio da dor! Exercícios de respiração, técnicas de relaxamento e meditação são opções que podem fazer parte do seu dia a dia.',
  ];

  @override
  void dispose() {
    super.dispose();
    _stepSelecionado = 0;
    _acertos = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teste seus conhecimentos',
          style: TextStyleMovedor.appBar,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Expanded(
                child: Stepper(
                  type: StepperType.horizontal,
                  currentStep: _stepSelecionado,
                  controlsBuilder: (context, controls) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(children: [
                        Flexible(
                          child: Container(
                            child: Center(
                              child: TextButton(
                                onPressed: cancel,
                                child: const Text(
                                  "Voltar",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            child: Center(
                              child: SizedBox(
                                width: 150,
                                height: 40,
                                child: ButtomWidget(
                                    texto: "Avançar",
                                    onPress: continued,
                                    textColor: CoresMovedor.textoBotaoCor,
                                    botaoColor: CoresMovedor.primary,
                                    habilitarBotao: true),
                              ),
                            ),
                          ),
                        )
                      ]),
                    );
                  },
                  steps: [
                    Step(
                      content: const StepTestQ1(),
                      state: _stepSelecionado > 0
                          ? StepState.complete
                          : _stepSelecionado == 0
                              ? StepState.editing
                              : StepState.disabled,
                      isActive: _stepSelecionado >= 0,
                      title: const Text(""),
                    ),
                    Step(
                      content: const StepTestQ2(),
                      isActive: _stepSelecionado >= 1,
                      state: _stepSelecionado > 1
                          ? StepState.complete
                          : _stepSelecionado == 1
                              ? StepState.editing
                              : StepState.disabled,
                      title: const Text(""),
                    ),
                    Step(
                      content: const StepTestQ3(),
                      isActive: _stepSelecionado >= 2,
                      state: _stepSelecionado > 2
                          ? StepState.complete
                          : _stepSelecionado == 2
                              ? StepState.editing
                              : StepState.disabled,
                      title: const Text(""),
                    ),
                    Step(
                      content: const StepTestQ4(),
                      isActive: _stepSelecionado >= 3,
                      state: _stepSelecionado > 3
                          ? StepState.complete
                          : _stepSelecionado == 3
                              ? StepState.editing
                              : StepState.disabled,
                      title: const Text(""),
                    ),
                    Step(
                      content: const StepTestQ5(),
                      isActive: _stepSelecionado >= 4,
                      state: _stepSelecionado > 4
                          ? StepState.complete
                          : _stepSelecionado == 4
                              ? StepState.editing
                              : StepState.disabled,
                      title: const Text(""),
                    ),
                    Step(
                      content: const StepTestQ6(),
                      isActive: _stepSelecionado >= 5,
                      state: _stepSelecionado > 5
                          ? StepState.complete
                          : _stepSelecionado == 5
                              ? StepState.editing
                              : StepState.disabled,
                      title: const Text(""),
                    ),
                    Step(
                      content: const StepTestQ7(),
                      isActive: _stepSelecionado >= 6,
                      state: _stepSelecionado > 6
                          ? StepState.complete
                          : _stepSelecionado == 6
                              ? StepState.editing
                              : StepState.disabled,
                      title: const Text(""),
                    ),
                    Step(
                      content: const StepTestQ8(),
                      isActive: _stepSelecionado >= 7,
                      state: _stepSelecionado > 7
                          ? StepState.complete
                          : _stepSelecionado == 7
                              ? StepState.editing
                              : StepState.disabled,
                      title: const Text(""),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  continued() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        switch (_stepSelecionado) {
          case 0:
            if (PesquisaController.instance.step1 != 0) {
              if (PesquisaController.instance.step1 == 1) {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[0],
                  'Parabéns sua resposta está correta',
                  0,
                  Colors.green,
                );
                _acertos += 1;
              } else {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[0],
                  'Infelizmente sua resposta está incorreta',
                  0,
                  Colors.red,
                );
              }
            } else {
              watchUtilTheEndWarningShowDialogErro(context);
            }
            break;
          case 1:
            if (PesquisaController.instance.step2 != 0) {
              if (PesquisaController.instance.step2 == 1) {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[1],
                  'Parabéns sua resposta está correta',
                  1,
                  Colors.green,
                );
                _acertos += 1;
              } else {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[1],
                  'Infelizmente sua resposta está incorreta',
                  1,
                  Colors.red,
                );
              }
            } else {
              watchUtilTheEndWarningShowDialogErro(context);
            }
            break;
          case 2:
            if (PesquisaController.instance.step3 != 0) {
              if (PesquisaController.instance.step3 == -1) {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[2],
                  'Parabéns sua resposta está correta',
                  2,
                  Colors.green,
                );
                _acertos += 1;
              } else {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[2],
                  'Infelizmente sua resposta está incorreta',
                  2,
                  Colors.red,
                );
              }
            } else {
              watchUtilTheEndWarningShowDialogErro(context);
            }
            break;
          case 3:
            if (PesquisaController.instance.step4 != 0) {
              if (PesquisaController.instance.step4 == -1) {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[3],
                  'Parabéns sua resposta está correta',
                  3,
                  Colors.green,
                );
                _acertos += 1;
              } else {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[3],
                  'Infelizmente sua resposta está incorreta',
                  3,
                  Colors.red,
                );
              }
            } else {
              watchUtilTheEndWarningShowDialogErro(context);
            }
            break;
          case 4:
            if (PesquisaController.instance.step5 != 0) {
              if (PesquisaController.instance.step5 == 1) {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[4],
                  'Parabéns sua resposta está correta',
                  4,
                  Colors.green,
                );
                _acertos += 1;
              } else {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[4],
                  'Infelizmente sua resposta está incorreta',
                  4,
                  Colors.red,
                );
              }
            } else {
              watchUtilTheEndWarningShowDialogErro(context);
            }
            break;
          case 5:
            if (PesquisaController.instance.step6 != 0) {
              if (PesquisaController.instance.step6 == -1) {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[5],
                  'Parabéns sua resposta está correta',
                  5,
                  Colors.green,
                );
                _acertos += 1;
              } else {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[5],
                  'Infelizmente sua resposta está incorreta',
                  5,
                  Colors.red,
                );
              }
            } else {
              watchUtilTheEndWarningShowDialogErro(context);
            }
            break;
          case 6:
            if (PesquisaController.instance.step7 != 0) {
              if (PesquisaController.instance.step7 == 1) {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[6],
                  'Parabéns sua resposta está correta',
                  6,
                  Colors.green,
                );
                _acertos += 1;
              } else {
                watchUtilTheEndWarningShowDialog(
                  context,
                  correctAnswers[6],
                  'Infelizmente sua resposta está incorreta',
                  6,
                  Colors.red,
                );
              }
            } else {
              watchUtilTheEndWarningShowDialogErro(context);
            }
            break;
          case 7:
            if (_stepSelecionado == 7) {
              if (PesquisaController.instance.step8 != 0) {
                if (PesquisaController.instance.step8 == -1) {
                  watchUtilTheEndWarningShowDialog(
                    context,
                    correctAnswers[7],
                    'Parabéns sua resposta está correta',
                    7,
                    Colors.green,
                  );
                  _acertos += 1;
                } else {
                  watchUtilTheEndWarningShowDialog(
                    context,
                    correctAnswers[7],
                    'Infelizmente sua resposta está incorreta',
                    7,
                    Colors.red,
                  );
                }
              } else {
                watchUtilTheEndWarningShowDialogErro(context);
              }
            }
            break;
        }
      }
    });
  }

  cancel() {
    _stepSelecionado > 0 ? setState(() => _stepSelecionado -= 1) : null;
  }

  Future<dynamic> watchUtilTheEndWarningShowDialogErro(
      BuildContext context) async {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                'Aviso',
                textAlign: TextAlign.center,
                style: TextStyle(color: CoresMovedor.textoPadrao),
              ),
              content: Text(
                'Marque um item',
                textAlign: TextAlign.center,
                style: const TextStyle(color: CoresMovedor.textoPadrao),
              ),
              actions: [
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: CoresMovedor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          )),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )),
                ),
              ],
            ));
  }

  Future<dynamic> watchUtilTheEndWarningShowDialog(BuildContext context,
      String answerC, String isCorrect, int step, Color colorAnswer) async {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                isCorrect,
                textAlign: TextAlign.center,
                style: TextStyle(color: colorAnswer),
              ),
              content: Text(
                answerC,
                textAlign: TextAlign.justify,
                style: const TextStyle(color: Colors.black),
              ),
              actions: [
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: CoresMovedor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          )),
                      onPressed: () {
                        if (step == 7) {
                          PesquisaController.instance.resetVariablesTestes();
                          Get.to(FinalizacaoTestesPage(acertos: _acertos));
                        } else {
                          setState(() => _stepSelecionado += 1);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )),
                ),
              ],
            ));
  }
}
