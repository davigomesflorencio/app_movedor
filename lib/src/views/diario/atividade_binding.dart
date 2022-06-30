import 'package:aplicacao/src/controllers/atividades_controller.dart';
import 'package:aplicacao/src/controllers/historico_atividades_controller.dart';
import 'package:get/get.dart';

class AtividadeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AtividadesController>(() {
      return AtividadesController();
    });
    Get.lazyPut<HistoricoAtividadesController>(() {
      return HistoricoAtividadesController();
    });
  }
}
