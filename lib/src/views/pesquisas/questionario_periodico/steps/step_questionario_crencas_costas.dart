import 'package:aplicacao/src/controllers/questionarios_periodicos_controller.dart';
import 'package:aplicacao/src/views/components/radio_item.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepQuestionarioCrencasCostas extends StatefulWidget {
  const StepQuestionarioCrencasCostas({Key? key}) : super(key: key);

  @override
  State<StepQuestionarioCrencasCostas> createState() =>
      _StepQuestionarioCrencasCostasState();
}

class _StepQuestionarioCrencasCostasState
    extends State<StepQuestionarioCrencasCostas> {
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        const Text(
          "Por favor marque cada afirmativa como falsa, possivelmente falsa, incerta, possivelmente verdadeira ou verdadeira",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        const Text(
          "Questões sobre suas próprias costas",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        question1(),
        SizedBox(
          height: size.height * 0.02,
        ),
        question2(),
        SizedBox(
          height: size.height * 0.02,
        ),
        question3(),
        SizedBox(
          height: size.height * 0.02,
        ),
        question4(),
      ],
    );
  }

  Widget question1() {
    return Obx(() {
      return Container(
        decoration: controller.clickValidate1.value &&
                controller.groupValue0.value == -1
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
                        text: "1. É facil machucar suas costas?",
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
                        groupValue: controller.groupValue0.value,
                        value: data.index,
                        onChanged: (val) {
                          setState(() {
                            controller.p1_facilMachucar.value =
                                selections[int.parse(val.toString())];
                            controller.groupValue0.value =
                                double.parse(val.toString());
                          });
                        },
                      ))
                  .toList(),
            ),
            controller.clickValidate1.value &&
                    controller.groupValue0.value == -1
                ? campoObrigatorio()
                : const SizedBox(),
          ],
        ),
      );
    });
  }

  Widget question2() {
    return Obx(() {
      return Container(
        decoration: controller.clickValidate1.value &&
                controller.groupValue1.value == -1
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
                            "2. Se não for cuidadoso, você pode machucar suas costas?",
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
                        groupValue: controller.groupValue1.value,
                        value: data.index,
                        onChanged: (val) {
                          setState(() {
                            controller.p2_cuidadasoMachucar.value =
                                selections[int.parse(val.toString())];
                            controller.groupValue1.value =
                                double.parse(val.toString());
                          });
                        },
                      ))
                  .toList(),
            ),
            controller.clickValidate1.value &&
                    controller.groupValue1.value == -1
                ? campoObrigatorio()
                : const SizedBox(),
          ],
        ),
      );
    });
  }

  Widget question3() {
    return Obx(() {
      return Container(
        decoration: controller.clickValidate1.value &&
                controller.groupValue2.value == -1
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
                            "3. Dor nas costas significa que você lesionou suas costas?",
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
                        groupValue: controller.groupValue2.value,
                        value: data.index,
                        onChanged: (val) {
                          setState(() {
                            controller.p3_significaLesionar.value =
                                selections[int.parse(val.toString())];
                            controller.groupValue2.value =
                                double.parse(val.toString());
                          });
                        },
                      ))
                  .toList(),
            ),
            controller.clickValidate1.value &&
                    controller.groupValue2.value == -1
                ? campoObrigatorio()
                : const SizedBox(),
          ],
        ),
      );
    });
  }

  Widget question4() {
    return Obx(() {
      return Container(
        decoration: controller.clickValidate1.value &&
                controller.groupValue3.value == -1
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
                            "4. Uma 'fisgadinha' nas costas pode ser o primeiro sinal de uma lesão séria?",
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
                        groupValue: controller.groupValue3.value,
                        value: data.index,
                        onChanged: (val) {
                          setState(() {
                            controller.p4_fisgadinhaLesao.value =
                                selections[int.parse(val.toString())];
                            controller.groupValue3.value =
                                double.parse(val.toString());
                          });
                        },
                      ))
                  .toList(),
            ),
            controller.clickValidate1.value &&
                    controller.groupValue3.value == -1
                ? campoObrigatorio()
                : const SizedBox(),
          ],
        ),
      );
    });
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
}
