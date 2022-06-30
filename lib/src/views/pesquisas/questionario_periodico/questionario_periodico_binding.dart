import 'package:aplicacao/src/controllers/questionarios_periodicos_controller.dart';
import 'package:get/get.dart';

class QuestionariosPeriodicosBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionariosPeriodicosController>(() {
      return QuestionariosPeriodicosController();
    });
  }
}
