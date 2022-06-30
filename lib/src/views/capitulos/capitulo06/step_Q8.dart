import 'package:aplicacao/src/controllers/pesquisas_controller.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';

class StepTestQ8 extends StatefulWidget {
  const StepTestQ8({Key? key}) : super(key: key);

  @override
  State<StepTestQ8> createState() => _StepTestQ8State();
}

class _StepTestQ8State extends State<StepTestQ8> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Exercícios de relaxamento irão ajudar no controle da dor lombar?",
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
            groupValue: PesquisaController.instance.step8,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step8 = value as int;
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
            groupValue: PesquisaController.instance.step8,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step8 = value as int;
              });
            },
            activeColor: CoresMovedor.primary,
          ),
        ),
      ],
    );
  }
}
