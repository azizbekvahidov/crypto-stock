// import 'package:rus_tili/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoadingController extends GetxService {
  final _isLoading = false.obs;

  String get language => Get.locale?.languageCode ?? 'uz';

  bool get isRussian => language == 'ru';

  set isLoading(value) => _isLoading.value = value;

  get isLoading => _isLoading.value;

  final _isLoadingPageShow = false.obs;

  get isLoadingPageShow => _isLoadingPageShow.value;

  Widget _loader() => Center(
          child: SpinKitDualRing(
        color: Get.theme.colorScheme.secondaryContainer,
        size: 50,
        duration: 1.seconds,
      ));

  showLoading() {
    _isLoading.value = true;
    Get.context?.loaderOverlay.show(widget: _loader());

    // EasyLoading.instance.backgroundColor = AppColors.primaryColor;
    // EasyLoading.show(
    //   dismissOnTap: false,
    //   status: "loading",
    //   maskType: EasyLoadingMaskType.black,
    // );
  }

  hideLoading() {
    _isLoading.value = false;
  }

  set isLoadingPageShow(value) {
    _isLoadingPageShow.value = value;
  }

  void showError(String error,
      {Duration? duration = const Duration(seconds: 3)}) {
    EasyLoading.instance.backgroundColor = Colors.red;
    EasyLoading.showError(
      error,
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
      duration: duration,
    );
  }

  void showSuccess(String success,
      {Duration? duration = const Duration(seconds: 3)}) {
    EasyLoading.instance.backgroundColor = Colors.green;
    EasyLoading.showSuccess(
      success,
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
      duration: duration,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.threeBounce;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    // EasyLoading.instance.backgroundColor = AppColors.primaryColorYellow;
    EasyLoading.instance.textColor = Colors.white;
    EasyLoading.instance.progressColor = Colors.white;
    EasyLoading.instance.indicatorColor = Colors.white;
    _isLoading.subject.listen((event) {
      if (event) {
        Get.context?.loaderOverlay.show(widget: _loader());
        // EasyLoading.instance.backgroundColor = AppColors.primaryColor;
        // EasyLoading.show(
        //   dismissOnTap: false,
        //   status: "loading",
        //   maskType: EasyLoadingMaskType.black,
        // );
      } else {
        Get.context?.loaderOverlay.hide();
      }
    });
    super.onReady();
  }
}
