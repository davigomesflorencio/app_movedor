import 'package:aplicacao/src/controllers/pesquisas_controller.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';

class StepTestQ2 extends StatefulWidget {
  const StepTestQ2({Key? key}) : super(key: key);

  @override
  State<StepTestQ2> createState() => _StepTestQ2State();
}

class _StepTestQ2State extends State<StepTestQ2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "A dor lombar crônica é uma condição grave de saúde?",
          textAlign: TextAlign.justify,
          style: TextStyleMovedor.secondaryTextStyle,
        ),
        ListTile(
          title: const Text(
            "Sim",
            style: TextStyleMovedor.secondaryTextStyle,
          ),
          leading: Radio(
            value: -1,
            groupValue: PesquisaController.instance.step2,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step2 = value as int;
              });
            },
            activeColor: CoresMovedor.primary,
          ),
        ),
        ListTile(
          title: const Text(
            "Não",
            style: TextStyleMovedor.secondaryTextStyle,
          ),
          leading: Radio(
            value: 1,
            groupValue: PesquisaController.instance.step2,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step2 = value as int;
              });
            },
            activeColor: CoresMovedor.primary,
          ),
        ),
      ],
    );
  }
}
