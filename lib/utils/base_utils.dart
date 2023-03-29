import '../features/loading/loading.dart';
import '../repository/api_repo.dart';
import 'package:get/get.dart';

mixin BaseUtils {
  final loadingController = Get.find<LoadingController>();
  final restClient = Get.find<RestClient>();
  // final storage = Get.find<AppPrefStorageService>();

}
