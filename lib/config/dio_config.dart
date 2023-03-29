import 'dart:io';

// import '../features/load_account/load_account_logic.dart';
import '../features/features.dart';

import '../features/loading/loading.dart';
import '../repository/response_data.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CustomInterceptor extends dio.Interceptor {
  final Logger logger = Get.put(Logger());
  final LoadingController loadingController = Get.put(LoadingController());

  @override
  void onRequest(
      dio.RequestOptions options, dio.RequestInterceptorHandler handler) {
    logger.i(
      "REQUEST >>>> " +
          options.uri.toString() +
          "\n headers : " +
          options.headers.values.toString() +
          "\n body : " +
          options.data.toString(),
    );
    return super.onRequest(options, handler);
  }

  @override
  Future onError(dio.DioError err, dio.ErrorInterceptorHandler handler) async {
    print("onError: ${err.response?.statusCode}");

    loadingController.isLoading = false;

    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.cancel:
      case DioErrorType.other:
        // Get.offAllNamed(InternalErrorPage.route);
        return;
      case DioErrorType.response:
        if (err.response?.statusCode == 401) {
          // LoadAccountLogic loadAccountLogic = Get.find();
          // loadAccountLogic.logout();
          final AuthenticationController _controller = Get.find();
          _controller.signOut();
          return;
        }

        // if (err.response?.statusCode == 500) {
        //   Get.offAllNamed(InternalErrorPage.route);
        //   return;
        // }

        ResponseData response =
            ResponseData.fromJson(err.response?.data, (object) {});
        if ((response.success == null) || !(response.success!)) {
          if (response.message != null) {
            loadingController.showError(response.message!);
            return;
          }
        }
        break;
    }

    return handler.next(err); // <--- THE TIP IS HERE
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
