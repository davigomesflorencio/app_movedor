import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';

class LocalNotificationsService extends GetxService {
  late GetStorage box = GetStorage();

  saveDateQuestionarioPeriodico(String key, String value) async {
    await box.write(key, value);
  }
}
