import '../../config/connection_service.dart';
import 'package:get/get.dart';

class NoConnectionController extends GetxController {
  ConnectionService connectionService = Get.find();

  void refreshNetworkStatus() {
    connectionService.refreshNetworkStatus();
  }
}
