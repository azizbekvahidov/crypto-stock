import 'dart:async';

// import 'package:rus_tili/pages/load_account/load_account_view.dart';
import '../features/loading/loading.dart';
import '../features/no_connection/no_connection_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectionService extends GetxService {
  StreamSubscription<ConnectivityResult>? subscription;
  LoadingController loadingController = Get.find();
  final _connectivity = Connectivity();

  void refreshNetworkStatus() async {
    loadingController.isLoading = true;
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Future.delayed(10.milliseconds, () {
        if (Get.currentRoute != NoConnectionPage.route) {
          Get.toNamed(NoConnectionPage.route);
        }
      });
    } else {
      // Future.delayed(10.milliseconds, () {
      // if (Get.previousRoute == LoadAccountPage.route) {
      //   Get.offAllNamed(LoadAccountPage.route);
      // } else {
      Get.back();
      // }
      // });
    }
    loadingController.isLoading = false;
  }

  @override
  void onClose() {
    subscription?.cancel();
  }

  @override
  void onReady() {
    subscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        // case ConnectivityResult.wifi:
        // case ConnectivityResult.ethernet:
        // case ConnectivityResult.mobile:
        // case ConnectivityResult.bluetooth:
        //   // if (Get.currentRoute != LoadAccountPage.route) {
        //   //   Get.offAllNamed(LoadAccountPage.route);
        //   // }
        //   print("Connection ..........");
        //   break;
        case ConnectivityResult.none:
          Get.toNamed(NoConnectionPage.route);
          break;
      }
    });
  }
}
