import 'package:aplicacao/src/controllers/questionarios_periodicos_controller.dart';
import 'package:aplicacao/src/views/components/radio_item.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepQuestionarioCrencasRecuperacaoParte2 extends StatefulWidget {
  const StepQuestionarioCrencasRecuperacaoParte2({Key? key}) : super(key: key);

  @override
  State<StepQuestionarioCrencasRecuperacaoParte2> createState() =>
      _StepQuestionarioCrencasRecuperacaoParte2State();
}

class _StepQuestionarioCrencasRecuperacaoParte2State
    extends State<StepQuestionarioCrencasRecuperacaoParte2> {
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
        questao8(),
        SizedBox(
          height: size.height * 0.02,
        ),
        questao9(),
        SizedBox(
          height: size.height * 0.02,
        ),
        questao10(),
        SizedBox(
          height: size.height * 0.02,
        ),
      ],
    );
  }

  Widget questao8() {
    return Obx(() {
      return Container(
        decoration: controller.clickValidate2.value &&
                controller.groupValue7.value == -1
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
                            "8. Ter a expectativa de que sua dor nas costas vai melhorar, ajuda você à recuperar-se da dor nas costas?",
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
                        groupValue: controller.groupValue7.value,
                        value: data.index,
                        onChanged: (val) {
                          setState(() {
                            controller.p8_terExpectativa.value =
                                selections[int.parse(val.toString())];
                            controller.groupValue7.value =
                                double.parse(val.toString());
                          });
                        },
                      ))
                  .toList(),
            ),
            controller.clickValidate2.value &&
                    controller.groupValue7.value == -1
                ? campoObrigatorio()
                : const SizedBox()
          ],
        ),
      );
    });
  }

  Widget questao9() {
    return Obx(() {
      return Container(
        decoration: controller.clickValidate2.value &&
                controller.groupValue8.value == -1
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
                            "9. Uma vez que você tenha tido dor nas costas, sempre existirá uma fraqueza?",
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
                        groupValue: controller.groupValue8.value,
                        value: data.index,
                        onChanged: (val) {
                          setState(() {
                            controller.p9_sempreFraco.value =
                                selections[int.parse(val.toString())];
                            controller.groupValue8.value =
                                double.parse(val.toString());
                          });
                        },
                      ))
                  .toList(),
            ),
            controller.clickValidate2.value &&
                    controller.groupValue8.value == -1
                ? campoObrigatorio()
                : const SizedBox()
          ],
        ),
      );
    });
  }

  Widget questao10() {
    return Obx(() {
      return Container(
        decoration: controller.clickValidate2.value &&
                controller.groupValue9.value == -1
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
                            "10. Existe uma grande chance de que um episódio de dor nas costas não se resolverá?",
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
                        groupValue: controller.groupValue9.value,
                        value: data.index,
                        onChanged: (val) {
                          setState(() {
                            controller.p10_naoSeResolvera.value =
                                selections[int.parse(val.toString())];
                            controller.groupValue9.value =
                                double.parse(val.toString());
                          });
                        },
                      ))
                  .toList(),
            ),
            controller.clickValidate2.value &&
                    controller.groupValue9.value == -1
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
