import 'package:aplicacao/src/controllers/atividades_controller.dart';
import 'package:aplicacao/src/controllers/historico_atividades_controller.dart';
import 'package:aplicacao/src/controllers/notificacao_controller.dart';
import 'package:aplicacao/src/controllers/questionarios_periodicos_controller.dart';
import 'package:get/get.dart';

class NavigationHomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionariosPeriodicosController>(() {
      return QuestionariosPeriodicosController();
    });
    Get.lazyPut<NotificacaoController>(() {
      return NotificacaoController();
    });
    Get.lazyPut<AtividadesController>(() {
      return AtividadesController();
    });
    Get.lazyPut<HistoricoAtividadesController>(() {
      return HistoricoAtividadesController();
    });
  }
}
