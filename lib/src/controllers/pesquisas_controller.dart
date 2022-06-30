// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class PesquisaController {
  PesquisaController._privateConstructor();

  static final PesquisaController _instance =
      PesquisaController._privateConstructor();
  static PesquisaController get instance => _instance;

  //Pesquisa dados pessoais
  final dataNascimentoController = TextEditingController();
  final cidadeController = TextEditingController();
  final tempoEstudoController = TextEditingController();
  final alturaController = TextEditingController();
  final pesoController = TextEditingController();

  double escalaDeDor = 0.0;
  String tempoDeDor = 'menos de 3 meses';

  var senteDorController = 0;
  var regiaoDaDorController = 0;

  //Teste Sobre Dor Na Lombar : Resposta Do Usuario
  var step1 = 0;
  var step2 = 0;
  var step3 = 0;
  var step4 = 0;
  var step5 = 0;
  var step6 = 0;
  var step7 = 0;
  var step8 = 0;

  resetVariablesTestes() {
    step1 = 0;
    step2 = 0;
    step3 = 0;
    step4 = 0;
    step5 = 0;
    step6 = 0;
    step7 = 0;
    step8 = 0;
  }
}
