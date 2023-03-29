import 'package:get/get.dart';

import 'no_connection_controller.dart';

class NoConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoConnectionController());
  }
}
