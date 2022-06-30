import 'package:aplicacao/src/controllers/pesquisas_controller.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';

class StepTestQ6 extends StatefulWidget {
  const StepTestQ6({Key? key}) : super(key: key);

  @override
  State<StepTestQ6> createState() => _StepTestQ6State();
}

class _StepTestQ6State extends State<StepTestQ6> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Caminhada é recomendada para pessoas com dor lombar?",
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
            groupValue: PesquisaController.instance.step6,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step6 = value as int;
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
            groupValue: PesquisaController.instance.step6,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step6 = value as int;
              });
            },
            activeColor: CoresMovedor.primary,
          ),
        ),
      ],
    );
  }
}
