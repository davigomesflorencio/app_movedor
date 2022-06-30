import 'package:aplicacao/src/controllers/notificacao_controller.dart';
import 'package:get/get.dart';

class NotificacaoBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificacaoController>(() {
      return NotificacaoController();
    });
  }
}
