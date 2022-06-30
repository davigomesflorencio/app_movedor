import 'package:aplicacao/src/views/pesquisas/questionario_periodico/steps/step_questionario_crencas_recuperacao_parte2.dart';
import 'package:flutter/material.dart';

class QuestionarioCrencasRecuperacao extends StatefulWidget {
  const QuestionarioCrencasRecuperacao({Key? key}) : super(key: key);

  @override
  State<QuestionarioCrencasRecuperacao> createState() =>
      _QuestionarioCrencasRecuperacaoState();
}

class _QuestionarioCrencasRecuperacaoState
    extends State<QuestionarioCrencasRecuperacao> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conhecendo um pouco sobre você"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: StepQuestionarioCrencasRecuperacaoParte2(),
            ),
          ],
        ),
      ),
    );
  }
}
