import 'package:aplicacao/src/controllers/questionarios_periodicos_controller.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepEscalaDeDor extends StatefulWidget {
  const StepEscalaDeDor({Key? key}) : super(key: key);

  @override
  State<StepEscalaDeDor> createState() => _StepEscalaDeDorState();
}

class _StepEscalaDeDorState extends State<StepEscalaDeDor> {
  @override
  Widget build(BuildContext context) {
    QuestionariosPeriodicosController controller = Get.find();

    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
            text:
                'Pensando em como está a sua dor nas costas hoje, qual a intensidade de dor você está sentindo, ',
            style: TextStyle(
              color: CoresMovedor.textoPadrao,
              fontFamily: "WorkSans",
              fontSize: 16,
            ),
            children: [
              TextSpan(
                text: 'numa escala de ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "WorkSans",
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: '0',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "WorkSans",
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: ' a ',
                style: TextStyle(
                  color: CoresMovedor.textoPadrao,
                  fontFamily: "WorkSans",
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: '10',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "WorkSans",
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: '?',
                style: TextStyle(
                  color: CoresMovedor.textoPadrao,
                  fontFamily: "WorkSans",
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: const [
              Text(
                "Sem dor",
                style: TextStyle(color: Colors.green),
              ),
              Spacer(),
              Text(
                "Muita dor",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.90,
          child: Slider(
              value: controller.escalaDeDor.value,
              max: 10.0,
              min: 0.0,
              divisions: 10,
              label: "${controller.escalaDeDor.value.toInt()}",
              inactiveColor: Colors.green[50],
              activeColor: controller.escalaDeDor.value.toInt() > 8
                  ? Colors.red
                  : controller.escalaDeDor.value.toInt() > 5
                      ? Colors.red[300]
                      : controller.escalaDeDor.value.toInt() > 3
                          ? Colors.green[300]
                          : Colors.green,
              onChanged: (double value) {
                setState(() {
                  controller.escalaDeDor.value = value;
                });
              }),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "A quanto tempo você sente essa dor?",
          style: TextStyle(
            color: CoresMovedor.textoPadrao,
            fontFamily: "WorkSans",
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: size.width * 0.6,
              child: DropdownButtonFormField(
                value: controller.tempoDeDor.value,
                icon: const Icon(Icons.arrow_downward),
                elevation: 20,
                alignment: Alignment.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    )),
                style: const TextStyle(color: CoresMovedor.primary),
                onChanged: (String? newValue) {
                  setState(() {
                    controller.tempoDeDor.value = newValue!;
                  });
                },
                items: [
                  'menos de 3 meses',
                  'de 3 a 11 meses',
                  '12 meses ou mais',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
