import 'package:aplicacao/src/views/components/text_style.dart';
import 'package:flutter/material.dart';

class StepIntroducaoRolandMorris extends StatefulWidget {
  const StepIntroducaoRolandMorris({Key? key}) : super(key: key);

  @override
  State<StepIntroducaoRolandMorris> createState() =>
      _StepIntroducaoRolandMorrisState();
}

class _StepIntroducaoRolandMorrisState
    extends State<StepIntroducaoRolandMorris> {
  @override
  Widget build(BuildContext context) {
    var _spaceBetweenParagraphs = const SizedBox(height: 15);

    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "Quando suas costas doem, você pode encontrar dificuldade em fazer algumas coisas que normalmente faz.",
            style: TextStyleMovedor.secondaryTextStyle,
          ),
          _spaceBetweenParagraphs,
          const Text(
            "A seguir apresentaremos uma lista que possui algumas frases que as pessoas têm utilizado para se descreverem quando sentem dores nas costas.",
            style: TextStyleMovedor.secondaryTextStyle,
          ),
          _spaceBetweenParagraphs,
          const Text(
            "Quando você ler estas frases, pode notar que algumas se destacam por descrever você hoje. Ao ler a lista, pense em você hoje.",
            style: TextStyleMovedor.secondaryTextStyle,
          ),
          _spaceBetweenParagraphs,
          const Text(
            "Quando ler uma frase que descreveu você hoje, assinale-a. Se a frase não descreve você, então deixe o espaço em branco e siga para a próxima frase.",
            style: TextStyleMovedor.secondaryTextStyle,
          ),
          _spaceBetweenParagraphs,
          const Text(
            "Assinale apenas a frase que tiver certeza que descreve você hoje.",
            style: TextStyleMovedor.secondaryTextStyle,
          ),
          SizedBox(
            height: TextStyleMovedor.secondaryTextStyle.fontSize,
          )
        ],
      ),
    );
  }
}
