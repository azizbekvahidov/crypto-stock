import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/base_utils.dart';

class MainController extends GetxController with BaseUtils {
  // WebViewController controller = WebViewController();

  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  @override
  void onInit() {
    // controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(Get.theme.backgroundColor)
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Update loading bar.
    //       },
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onWebResourceError: (WebResourceError error) {},
    //     ),
    //   )
    //   ..loadRequest(Uri.parse(
    //       'https://bi.tashkent.uz/viewer/public?dashboardGuid=90923444caa64088af90e4b9d3a554a7&showNav=true&fit=true'));
    // TODO: implement onInit
    super.onInit();
  }

  setUrl({Uri? uri}) {
    url = uri.toString();
    urlController.text = url;
    update();
  }
}
