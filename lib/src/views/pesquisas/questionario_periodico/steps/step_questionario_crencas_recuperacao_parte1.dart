import 'package:aplicacao/src/controllers/questionarios_periodicos_controller.dart';
import 'package:aplicacao/src/views/components/radio_item.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepQuestionarioCrencasRecuperacaoParte1 extends StatefulWidget {
  const StepQuestionarioCrencasRecuperacaoParte1({Key? key}) : super(key: key);

  @override
  State<StepQuestionarioCrencasRecuperacaoParte1> createState() =>
      _StepQuestionarioCrencasRecuperacaoParte1State();
}

class _StepQuestionarioCrencasRecuperacaoParte1State
    extends State<StepQuestionarioCrencasRecuperacaoParte1> {
  QuestionariosPeriodicosController controller = Get.find();

  static const List<String> selections = <String>[
    "Falsa",
    "Possivelmente Falsa",
    "Incerta",
    "Possivelmente Verdadeira",
    "Verdadeira",
  ];

  List<RadioItem> listItems = [
    RadioItem(
      index: 0,
      opcao: selections[0],
    ),
    RadioItem(
      index: 1,
      opcao: selections[1],
    ),
    RadioItem(
      index: 2,
      opcao: selections[2],
    ),
    RadioItem(
      index: 3,
      opcao: selections[3],
    ),
    RadioItem(
      index: 4,
      opcao: selections[4],
    ),
  ];

  bool clickValidate2 = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Por favor marque cada afirmativa como falsa, possivelmente falsa, incerta, possivelmente verdadeira ou verdadeira",
          style: TextStyleMovedor.secondaryTextStyle,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        const Text(
          "Essas questões são sobre o que você deve fazer se tiver dor nas costas:",
          style: TextStyleMovedor.secondaryTextStyle,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        questao5(),
        SizedBox(
          height: size.height * 0.02,
        ),
        questao6(),
        SizedBox(
          height: size.height * 0.02,
        ),
        questao7(),
        SizedBox(
          height: size.height * 0.02,
        ),
      ],
    );
  }

  Widget questao5() {
    return Obx(() {
      return Container(
        decoration: controller.clickValidate2.value &&
                controller.groupValue4.value == -1
            ? boxDecorationError()
            : null,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: const [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                            "5. Se você tem dor nas costas, você deve evitar exercícios físicos?",
                        style: TextStyleMovedor.secondaryTextStyle,
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: listItems
                  .map((data) => RadioListTile(
                        title: Text(
                          data.opcao,
                          style: TextStyleMovedor.thirdTextStyle,
                        ),
                        groupValue: controller.groupValue4.value,
                        value: data.index,
                        onChanged: (val) {
                          setState(() {
                            controller.p5_evitarExercicios.value =
                                selections[int.parse(val.toString())];
                            controller.groupValue4.value =
                                double.parse(val.toString());
                          });
                        },
                      ))
                  .toList(),
            ),
            controller.clickValidate2.value &&
                    controller.groupValue4.value == -1
                ? campoObrigatorio()
                : const SizedBox()
          ],
        ),
      );
    });
  }

  Widget questao6() {
    return Obx(() {
      return Container(
        decoration: controller.clickValidate2.value &&
                controller.groupValue5.value == -1
            ? boxDecorationError()
            : null,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: const [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                            "6. Se você tem dor nas costas, você deveria tentar se manter ativo?",
                        style: TextStyleMovedor.secondaryTextStyle,
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: listItems
                  .map((data) => RadioListTile(
                        title: Text(
                          data.opcao,
                          style: TextStyleMovedor.thirdTextStyle,
                        ),
                        groupValue: controller.groupValue5.value,
                        value: data.index,
                        onChanged: (val) {
                          setState(() {
                            controller.p6_manterAtivo.value =
                                selections[int.parse(val.toString())];
                            controller.groupValue5.value =
                                double.parse(val.toString());
                          });
                        },
                      ))
                  .toList(),
            ),
            controller.clickValidate2.value &&
                    controller.groupValue5.value == -1
                ? campoObrigatorio()
                : const SizedBox(),
          ],
        ),
      );
    });
  }

  Widget questao7() {
    return Obx(() {
      return Container(
        decoration: controller.clickValidate2.value &&
                controller.groupValue6.value == -1
            ? boxDecorationError()
            : null,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: const [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                            "7. Focar em outras coisas que não sejam as suas costas ajuda você a recuperar-se da dor nas costas?",
                        style: TextStyleMovedor.secondaryTextStyle,
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: listItems
                  .map((data) => RadioListTile(
                        title: Text(
                          data.opcao,
                          style: TextStyleMovedor.thirdTextStyle,
                        ),
                        groupValue: controller.groupValue6.value,
                        value: data.index,
                        onChanged: (val) {
                          setState(() {
                            controller.p7_focarCoisas.value =
                                selections[int.parse(val.toString())];
                            controller.groupValue6.value =
                                double.parse(val.toString());
                          });
                        },
                      ))
                  .toList(),
            ),
            controller.clickValidate2.value &&
                    controller.groupValue6.value == -1
                ? campoObrigatorio()
                : const SizedBox()
          ],
        ),
      );
    });
  }

  BoxDecoration boxDecorationError() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.red,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    );
  }

  Column campoObrigatorio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            height: 10,
            color: Color(0XFF999999),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            child: Text(
              "Campo obrigatório",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
