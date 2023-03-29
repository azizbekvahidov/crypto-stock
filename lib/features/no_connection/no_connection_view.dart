// import 'package:rus_tili/utils/assets_manager.dart';

// import 'package:rus_tili/widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'no_connection_controller.dart';

class NoConnectionPage extends StatelessWidget {
  static const String route = "/no-connection";

  final logic = Get.find<NoConnectionController>();

  NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Center(
    //     child: Text("no connection"),
    //   ),
    // );
    return
        // AbstractInfoPageScaffold(
        //   buttonIconType: ButtonIconType.REFRESH,
        //   willPop: false,
        //   bottomButtonText: 'try-again'.tr,
        //   onTap: () {
        //     logic.refreshNetworkStatus();
        //   },
        //   body:
        Container(
      width: context.width,
      height: context.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: context.width * .6,
            child: Text(
              'no-connection'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () {
                logic.refreshNetworkStatus();
              },
              child: Text(
                "refresh",
                style: Get.textTheme.headline2!.copyWith(fontSize: 24),
              ))
        ],
      ),
    );
    // );
  }
}
