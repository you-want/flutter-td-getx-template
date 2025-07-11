import 'package:get/get.dart';
import '../../../core/network/service/auth/auth_api.dart';
import '../../../core/network/di/network_model.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // 注入 AuthApi
    Get.lazyPut<AuthApi>(() => AuthApi(NetworkModel.getInstance()));
    // 注入 LoginController
    Get.lazyPut<LoginController>(() => LoginController());
  }
}