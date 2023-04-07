import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/base_utils.dart';

class ApplicationCreateController extends GetxController with BaseUtils {
  String type = 'sell';

  @override
  void onInit() {
    super.onInit();
  }

  selectType({required String selectedType}) {
    type = selectedType;
    update();
  }
}
