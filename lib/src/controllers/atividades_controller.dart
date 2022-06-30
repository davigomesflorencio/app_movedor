import 'package:aplicacao/src/models/atividades.dart';
import 'package:aplicacao/src/services/auth_login_service.dart';
import 'package:aplicacao/src/services/firestore_database_service.dart';
import 'package:aplicacao/src/views/components/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AtividadesController extends GetxController {
  var atividadeSelecionada = '';
  String selectedValue = "Exercícios aeróbicos";
  int minInicio = 0;
  int hrInicio = 0;
  double tempoAtividade = 10;
  String textTimeInicial = 'Adicionar horário';

  List<bool> valoresDias = [false, false, false, false, false, false, false];

  RxBool editar_ou_deletar_atividade = false.obs;

  DocumentReference? referenceAtividade;

  limparValoresDoController() {
    atividadeSelecionada = "Exercícios aeróbicos";
    selectedValue = "Exercícios aeróbicos";
    minInicio = 0;
    hrInicio = 0;
    tempoAtividade = 10;
    textTimeInicial = 'Adicionar horário';
    for (int i = 0; i < 7; i++) {
      valoresDias[i] = false;
      btmColors[i] = Colors.grey;
    }
  }

  setarValoresNoController(Atividades atividade) {
    atividadeSelecionada = atividade.tipo_atividade.toString();
    selectedValue = atividade.tipo_atividade.toString();

    final split = atividade.hora_inicio.toString().split(':');

    minInicio = int.parse(split[1]);
    hrInicio = int.parse(split[0]);
    tempoAtividade = double.parse(atividade.duracao!);
    textTimeInicial = atividade.hora_inicio.toString();
    valoresDias[0] = atividade.domingo!;
    valoresDias[1] = atividade.segunda!;
    valoresDias[2] = atividade.terca!;
    valoresDias[3] = atividade.quarta!;
    valoresDias[4] = atividade.quinta!;
    valoresDias[5] = atividade.sexta!;
    valoresDias[6] = atividade.sabado!;

    referenceAtividade = atividade.reference;

    for (int i = 0; i < 7; i++)
      btmColors[i] = valoresDias[i] ? btmColorOn : Colors.grey;
  }

  salvarAtividade() async {
    Atividades atividade = Atividades();
    atividade.id_usuario = AuthService.authInstance.user!.uid;
    atividade.hora_inicio = hrInicio.toString() + ':' + minInicio.toString();
    atividade.duracao = (tempoAtividade).toInt().toString();
    atividade.tipo_atividade = atividadeSelecionada.toString();

    atividade.domingo = valoresDias[0];
    atividade.segunda = valoresDias[1];
    atividade.terca = valoresDias[2];
    atividade.quarta = valoresDias[3];
    atividade.quinta = valoresDias[4];
    atividade.sexta = valoresDias[5];
    atividade.sabado = valoresDias[6];

    await FirestoreDatabaseService.instance
        .saveAtividades(atividades: atividade);
  }

  atualizarAtividade() async {
    Atividades atividade = Atividades();
    atividade.id_usuario = AuthService.authInstance.user!.uid;
    atividade.hora_inicio = hrInicio.toString() + ':' + minInicio.toString();
    atividade.duracao = (tempoAtividade).toInt().toString();
    atividade.tipo_atividade = atividadeSelecionada.toString();

    atividade.domingo = valoresDias[0];
    atividade.segunda = valoresDias[1];
    atividade.terca = valoresDias[2];
    atividade.quarta = valoresDias[3];
    atividade.quinta = valoresDias[4];
    atividade.sexta = valoresDias[5];
    atividade.sabado = valoresDias[6];
    atividade.reference = referenceAtividade;

    setarValoresNoController(atividade);
    await FirestoreDatabaseService.instance
        .saveAtividades(atividades: atividade);
  }

  RxList<Atividades> atividades = RxList.empty(growable: true);

  buscarAtividadesDoUsuario() async {
    String uid = AuthService.authInstance.user!.uid;
    await FirestoreDatabaseService.instance
        .getAtividadesPorIdUsuario(
      uid: uid,
    )
        .then((value) {
      if (value != null) {
        atividades.value = value;
      }
    });
  }

  List<Atividades> getAtividadesDoDia(String dia) {
    switch (dia) {
      case '0':
        return AtividadesDomingo();
      case '1':
        return AtividadesSegunda();
      case '2':
        return AtividadesTerca();
      case '3':
        return AtividadesQuarta();
      case '4':
        return AtividadesQuinta();
      case '5':
        return AtividadesSexta();
      default:
        return AtividadesSabado();
    }
  }

  List<Atividades> AtividadesSegunda() {
    return atividades.where((element) => element.segunda == true).toList();
  }

  List<Atividades> AtividadesTerca() {
    return atividades.where((element) => element.terca == true).toList();
  }

  List<Atividades> AtividadesQuarta() {
    return atividades.where((element) => element.quarta == true).toList();
  }

  List<Atividades> AtividadesQuinta() {
    return atividades.where((element) => element.quinta == true).toList();
  }

  List<Atividades> AtividadesSexta() {
    return atividades.where((element) => element.sexta == true).toList();
  }

  List<Atividades> AtividadesSabado() {
    return atividades.where((element) => element.sabado == true).toList();
  }

  List<Atividades> AtividadesDomingo() {
    return atividades.where((element) => element.domingo == true).toList();
  }

  Atividades? getAtividadePorId(String referenceAtividade) {
    return atividades.firstWhereOrNull(
        (element) => element.reference!.id == referenceAtividade);
  }

  late List<Color> corOf = List.empty(growable: true);
  late List<Color> atividadeBordas = List.empty(growable: true);
  late List<Color> atividadeBox = List.empty(growable: true);
  List<Color> btmColors = List.filled(7, Colors.grey);
  Color btmColorOn = CoresMovedor.primary;

  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(
      child: Text("Exercícios aeróbicos"),
      value: "Exercícios aeróbicos",
    ),
    DropdownMenuItem(
      child: Text("Exercícios de fortalecimento"),
      value: "Exercícios de fortalecimento",
    ),
    DropdownMenuItem(
      child: Text("Exercícios ou técnicas de relaxamento"),
      value: "Exercícios ou técnicas de relaxamento",
    ),
    DropdownMenuItem(
      child: Text("Exercícios aquáticos"),
      value: "Exercícios aquáticos",
    ),
    DropdownMenuItem(
      child: Text("Ioga, tai chi chuan"),
      value: "Ioga, tai chi chuan",
    ),
    DropdownMenuItem(
      child: Text("Dança"),
      value: "Dança",
    ),
  ];
}
