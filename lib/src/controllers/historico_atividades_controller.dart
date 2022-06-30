import 'package:aplicacao/src/controllers/atividades_controller.dart';
import 'package:aplicacao/src/models/historico_atividades.dart';
import 'package:aplicacao/src/services/auth_login_service.dart';
import 'package:aplicacao/src/services/firestore_database_service.dart';
import 'package:get/get.dart';

class HistoricoAtividadesController extends GetxController {
  AtividadesController atividadesController = Get.find();

  RxList<HistoricoAtividades> historicoAtividades =
      RxList.empty(growable: true);

  List<String> labels = [
    "Repouso",
    "Demasiado leve",
    "Muito leve",
    "Muito leve-leve",
    "Leve",
    "Leve-Moderado",
    "Moderado",
    "Moderado-Intenso",
    "Intenso",
    "Muito intenso",
    "Exaustivo",
  ];

  Future<void> buscarHistoricoAtividades() async {
    await FirestoreDatabaseService.instance
        .getHistoricoPorIdUsuario(uid: AuthService.authInstance.getUID())
        .then((value) {
      if (value != null) {
        historicoAtividades.value = value;
      }
    });
  }

  void criarHistoricoAtividade(
    String reference,
    bool fezAtividade,
    String motivo,
    int esforco,
    double duracaoAtividade,
    String data,
  ) async {
    HistoricoAtividades historicoAtividades = HistoricoAtividades();

    double duracao = double.parse(
        atividadesController.getAtividadePorId(reference)!.duracao!);

    historicoAtividades.id_atividade = reference;
    historicoAtividades.id_usuario = AuthService.authInstance.getUID();
    historicoAtividades.fez = fezAtividade;
    historicoAtividades.motivo = motivo;
    historicoAtividades.data_atividade = data;
    historicoAtividades.tempo = duracaoAtividade;
    historicoAtividades.esforco = esforco != -1 ? labels[esforco] : "";

    await FirestoreDatabaseService.instance
        .saveHistoricoAtividades(historicoAtividades: historicoAtividades);

    buscarHistoricoAtividades();
  }
}
