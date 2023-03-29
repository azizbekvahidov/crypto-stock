import 'dart:developer';

import '../config/dio_config.dart';
import '../constants/api_constants.dart';
import '../repository/api_repo.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

final dio = Dio(
  BaseOptions(
      connectTimeout: 30 * 1000, // 30 seconds
      receiveTimeout: 30 * 1000 // 30 seconds
      ),
)..interceptors.addAll(
    [
      CustomInterceptor(),
      // if (withAlice) ...{alice.getDioInterceptor()}
    ],
  );

RestClient configureDio(String? token) {
  log("Token  : >>>>>>>>>>>> \n ${token.toString()}");
  dio.options.baseUrl = ApiConstants.warehouseApi;
  if (token == null) {
    dio.options.headers
        .remove("Authorization"); // config your dio headers globally
  } else {
    dio.options.headers["Authorization"] = "bearer $token";
  }
  Get.delete<RestClient>();
  return Get.put<RestClient>(
      RestClient(dio, ApiConstants.warehouseApi, ApiConstants.orderApi,
          ApiConstants.authApi),
      permanent: true);
}
