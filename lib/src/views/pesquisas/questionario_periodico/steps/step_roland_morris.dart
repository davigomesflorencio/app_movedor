import 'package:aplicacao/src/controllers/questionarios_periodicos_controller.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepRolandMorris extends StatefulWidget {
  const StepRolandMorris({Key? key}) : super(key: key);

  @override
  State<StepRolandMorris> createState() => _StepRolandMorrisState();
}

class _StepRolandMorrisState extends State<StepRolandMorris> {
  @override
  Widget build(BuildContext context) {
    QuestionariosPeriodicosController controller = Get.find();

    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Assinale apenas a frase que tiver certeza que descreve você hoje.",
              style: TextStyleMovedor.secondaryTextStyle,
            ),
            SizedBox(
              height: TextStyleMovedor.secondaryTextStyle.fontSize,
            ),
            ...controller.questions
                .map((e) => CheckboxListTile(
                    contentPadding: const EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      e,
                      style: TextStyleMovedor.secondaryTextStyle,
                    ),
                    value: controller
                        .respostasMedicamentos[controller.questions.indexOf(e)],
                    onChanged: (bool? value) {
                      setState(() {
                        controller.respostasMedicamentos[
                            controller.questions.indexOf(e)] = value!;
                      });
                    }))
                .toList(),
            SizedBox(
              height: TextStyleMovedor.secondaryTextStyle.fontSize,
            ),
          ],
        ),
      );
    });
  }
}
