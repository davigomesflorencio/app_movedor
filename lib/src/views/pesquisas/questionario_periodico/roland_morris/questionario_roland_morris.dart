import 'package:aplicacao/src/views/pesquisas/questionario_periodico/steps/step_roland_morris.dart';
import 'package:flutter/material.dart';

class QuestionarioRolandMorris extends StatefulWidget {
  const QuestionarioRolandMorris({Key? key}) : super(key: key);

  @override
  State<QuestionarioRolandMorris> createState() =>
      _QuestionarioRolandMorrisState();
}

class _QuestionarioRolandMorrisState extends State<QuestionarioRolandMorris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roland Morris'),
        centerTitle: true,
      ),
      body: const StepRolandMorris(),
    );
  }
}
