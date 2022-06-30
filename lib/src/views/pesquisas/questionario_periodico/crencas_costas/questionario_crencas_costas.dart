import 'package:aplicacao/src/views/pesquisas/questionario_periodico/steps/step_questionario_crencas_costas.dart';
import 'package:flutter/material.dart';

class QuestionarioCrencasCostas extends StatefulWidget {
  const QuestionarioCrencasCostas({Key? key}) : super(key: key);

  @override
  State<QuestionarioCrencasCostas> createState() =>
      _QuestionarioCrencasCostasState();
}

class _QuestionarioCrencasCostasState extends State<QuestionarioCrencasCostas> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conhecendo um pouco sobre você"),
      ),
      body: SafeArea(
        child: ListView(children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: StepQuestionarioCrencasCostas(),
          ),
        ]),
      ),
    );
  }
}
