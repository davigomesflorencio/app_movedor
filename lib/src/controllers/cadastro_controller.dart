import 'package:aplicacao/src/models/dados_pessoais.dart';
import 'package:aplicacao/src/models/questionario_atividade_fisica.dart';
import 'package:aplicacao/src/models/questionario_local_dor.dart';
import 'package:aplicacao/src/models/questionario_sintomas.dart';
import 'package:aplicacao/src/models/usuario.dart';
import 'package:aplicacao/src/services/auth_login_service.dart';
import 'package:aplicacao/src/services/firestore_database_service.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_ativ_fisicas.dart';
import 'package:aplicacao/src/views/cadastro/steps/step_sintomas.dart';
import 'package:flutter/material.dart';

import '../util/auth_exception.dart';

class CadastroController {
  CadastroController._privateConstructor();

  static final CadastroController _instance =
      CadastroController._privateConstructor();
  static CadastroController get instance => _instance;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyDadosUsuario = GlobalKey<FormState>();

  Usuario? _usuario = Usuario();

// Cadastro inicial
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();
  final nomeController = TextEditingController();

  bool habilitarBotao = true;
  bool mostrarSenha = true;

  //Meus dados
  final dataNascimentoController = TextEditingController();
  final cidadeController = TextEditingController();
  final tempoEstudoController = TextEditingController();
  final alturaController = TextEditingController();
  final pesoController = TextEditingController();

// Sobre as dores
  var senteDorController = 0;
  var regiaoDaDorController = 0;

  //Pesquisa atividades fisicas
  List<AtividadeFisicaCheckbox> listaAtividades = [
    AtividadeFisicaCheckbox("Caminhar com os amigos", false),
    AtividadeFisicaCheckbox("Correr ao ar livre ou andar de bicicleta", false),
    AtividadeFisicaCheckbox("Dançar", false),
    AtividadeFisicaCheckbox("Nadar", false),
    AtividadeFisicaCheckbox("Academia na praça", false),
    AtividadeFisicaCheckbox("Outra(s)", false),
    AtividadeFisicaCheckbox("Não pratico atividades físicas", false),
  ];

// Sintomas
  List<SintomasCheckbox> listSintomas = [
    SintomasCheckbox("Nenhum sintoma", false),
    SintomasCheckbox("Infecção", false),
    SintomasCheckbox("Câncer", false),
    SintomasCheckbox("Febre", false),
    SintomasCheckbox("Perda de sensibilidade progressiva", false),
    SintomasCheckbox("Eventos traumáticos graves", false),
    SintomasCheckbox("Incontinência urinária ou fecal", false),
  ];

// Usuario Editavel

  //Dados Pessoais
  DadosPessoais dadosPessoaisEditar = new DadosPessoais(
    altura: 1.67,
    peso: 56,
    cidade: 'Quixadá',
    tempoEstudo: 12,
    dataNascimento: "10/05/1999"
  );
  //Atividades
  QuestionarioAtividadeFisica atividadeFisicaEditar = new QuestionarioAtividadeFisica(
    ativ_fisica_academia: true,
    ativ_fisica_caminhar: false,
    ativ_fisica_correr: true,
    ativ_fisica_dancar: false,
    ativ_fisica_nadar: true,
    ativ_fisica_nao_pratica: false,
    ativ_fisica_outras: false,
  );

  limparValoresDoController() {
    dataNascimentoController.text = "";
    cidadeController.text = "";
    tempoEstudoController.text = "";
    alturaController.text = "";
    pesoController.text = "";

    emailController.text = '';
    senhaController.text = '';
    confirmarSenhaController.text = '';
    nomeController.text = '';

    senteDorController = 0;
    regiaoDaDorController = 0;

    for (int i = 0; i < 7; i++) {
      listaAtividades[i].check = false;
      listSintomas[i].check = false;
    }
  }

  criarConta(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      habilitarBotao = !habilitarBotao;

      try {
        await AuthService.authInstance.criarContaUsuario(
          nome: nomeController.text,
          email: emailController.text,
          senha: senhaController.text,
        );
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            content: Text(e.message),
          ),
        );
      }
    }
  }

  salvarDadosConta() async {
    if (AuthService.authInstance.getUID() != null) {
      habilitarBotao = !habilitarBotao;
      _usuario?.id = AuthService.authInstance.user!.uid;
      saveUser();
      saveQuestionarioLocalDor();
      saveQuestionarioAtividadeFisica();
      saveQuestionarioSintomas();
      limparValoresDoController();
    }
  }

// Metodos
  Future saveUser() async {
    DadosPessoais data = DadosPessoais(
        dataNascimento: dataNascimentoController.text,
        cidade: cidadeController.text,
        tempoEstudo: int.parse(tempoEstudoController.text),
        altura: double.parse(
          alturaController.value.text
              .toString()
              .replaceAll(',', '.')
              .toString(),
        ),
        peso: double.parse(pesoController.text));

    _usuario!.dadosPessoais = data;
    _usuario?.id = AuthService.authInstance.user!.uid;

    await FirestoreDatabaseService.instance.saveUser(usuario: _usuario);
  }

  Future saveQuestionarioLocalDor() async {
    QuestionarioLocalDor localDor = QuestionarioLocalDor();
    localDor.id = _usuario!.id;
    localDor.local_dor_sente = senteDorController.toInt();
    localDor.local_dor_regiao = regiaoDaDorController.toInt();
    await FirestoreDatabaseService.instance
        .saveQuestionarioLocalDor(localDor: localDor);
  }

  Future saveQuestionarioAtividadeFisica() async {
    QuestionarioAtividadeFisica atividadeFisica = QuestionarioAtividadeFisica();
    atividadeFisica.id = _usuario!.id;
    atividadeFisica.ativ_fisica_caminhar = listaAtividades[0].check;
    atividadeFisica.ativ_fisica_correr = listaAtividades[1].check;
    atividadeFisica.ativ_fisica_dancar = listaAtividades[2].check;
    atividadeFisica.ativ_fisica_nadar = listaAtividades[3].check;
    atividadeFisica.ativ_fisica_academia = listaAtividades[4].check;
    atividadeFisica.ativ_fisica_outras = listaAtividades[5].check;
    atividadeFisica.ativ_fisica_nao_pratica = listaAtividades[6].check;
    await FirestoreDatabaseService.instance
        .saveQuestionarioAtividadeFisica(atividadeFisica: atividadeFisica);
  }

  Future saveQuestionarioSintomas() async {
    QuestionarioSintomas sintomas = QuestionarioSintomas();
    sintomas.id = _usuario!.id;
    sintomas.sintomas_nenhum = listSintomas[0].check;
    sintomas.sintomas_infeccao = listSintomas[1].check;
    sintomas.sintomas_cancer = listSintomas[2].check;
    sintomas.sintomas_febre = listSintomas[3].check;
    sintomas.sintomas_perda = listSintomas[4].check;
    sintomas.sintomas_eventos = listSintomas[5].check;
    sintomas.sintomas_incontinencia = listSintomas[6].check;
    await FirestoreDatabaseService.instance
        .saveQuestionarioSintomas(sintomas: sintomas);
  }

  Future saveCapituloConcluido(int cap) async {
    switch (cap) {
      case 1:
        _usuario!.moduloConceitosBasicos = true;
        break;
      case 2:
        _usuario!.moduloImportanciaMovimento = true;
        break;
      case 3:
        _usuario!.moduloExerciciosFisicos = true;
        break;
      case 4:
        _usuario!.moduloApoioEspecializado = true;
        break;
      case 5:
        _usuario!.moduloTestesConhecimentos = true;
        break;
    }
    await FirestoreDatabaseService.instance.saveUser(usuario: _usuario);
  }
}
