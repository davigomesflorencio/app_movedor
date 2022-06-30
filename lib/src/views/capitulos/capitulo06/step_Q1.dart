import 'package:aplicacao/src/controllers/pesquisas_controller.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';

class StepTestQ1 extends StatefulWidget {
  const StepTestQ1({Key? key}) : super(key: key);

  @override
  State<StepTestQ1> createState() => _StepTestQ1State();
}

class _StepTestQ1State extends State<StepTestQ1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Exames de imagem (ressonância magnética, por exemplo) devem ser solicitados para a maioria das pessoas com dor lombar crônica?",
          style: TextStyleMovedor.secondaryTextStyle,
          textAlign: TextAlign.justify,
        ),
        ListTile(
          title: const Text(
            "Sim",
            style: TextStyleMovedor.secondaryTextStyle,
          ),
          leading: Radio(
            value: -1,
            groupValue: PesquisaController.instance.step1,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step1 = value as int;
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
            groupValue: PesquisaController.instance.step1,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step1 = value as int;
              });
            },
            activeColor: CoresMovedor.primary,
          ),
        ),
      ],
    );
  }
}
