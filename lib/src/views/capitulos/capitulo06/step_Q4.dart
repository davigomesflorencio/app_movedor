import 'package:aplicacao/src/controllers/pesquisas_controller.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';

class StepTestQ4 extends StatefulWidget {
  const StepTestQ4({Key? key}) : super(key: key);

  @override
  State<StepTestQ4> createState() => _StepTestQ1State();
}

class _StepTestQ1State extends State<StepTestQ4> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Sentir dor nas costas durante um exercício físico é normal, contanto que ele não aumente ou continue depois da atividade?",
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
            groupValue: PesquisaController.instance.step4,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step4 = value as int;
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
            groupValue: PesquisaController.instance.step4,
            onChanged: (value) {
              setState(() {
                PesquisaController.instance.step4 = value as int;
              });
            },
            activeColor: CoresMovedor.primary,
          ),
        ),
      ],
    );
  }
}
