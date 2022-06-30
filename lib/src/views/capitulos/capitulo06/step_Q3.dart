import 'package:aplicacao/src/controllers/pesquisas_controller.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';

class StepTestQ3 extends StatefulWidget {
  const StepTestQ3({Key? key}) : super(key: key);

  @override
  State<StepTestQ3> createState() => _StepTestQ3State();
}

class _StepTestQ3State extends State<StepTestQ3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "A dor lombar crônica é uma queixa comum na população?",
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
            groupValue: PesquisaController.instance.step3,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step3 = value as int;
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
            groupValue: PesquisaController.instance.step3,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step3 = value as int;
              });
            },
            activeColor: CoresMovedor.primary,
          ),
        ),
      ],
    );
  }
}
