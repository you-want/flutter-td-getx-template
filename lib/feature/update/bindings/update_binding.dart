import 'package:get/get.dart';

import '../controllers/update_controller.dart';

class UpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateController>(
      () => UpdateController(),
    );
  }
}