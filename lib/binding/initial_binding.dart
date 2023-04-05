import 'package:get_storage/get_storage.dart';
import '../repository/app_pref_storage_service.dart';

import '../constants/api_constants.dart';
import '../features/loading/loading.dart';
import '../repository/api_repo.dart';
import 'package:get/get.dart';
import '../utils/api_utils.dart';

import 'package:logger/logger.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put<ConnectionService>(ConnectionService(), permanent: true);
    Get.put<LoadingController>(
      LoadingController(),
      permanent: true,
    );
    // Get.put<DeviceInfoManager>(DeviceInfoManager(), permanent: true);
    Get.put<RestClient>(RestClient(dio), permanent: true);
    Get.lazyPut<Logger>(() => Logger(), fenix: true);
    Get.put<AppPrefStorageService>(
      AppPrefStorageService(GetStorage()),
      permanent: true,
    );
  }
}
