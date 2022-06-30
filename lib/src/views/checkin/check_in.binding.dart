import 'package:aplicacao/src/services/auth_login_service.dart';
import 'package:get/get.dart';

class CheckInBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() {
      return AuthService();
    });
  }
}
