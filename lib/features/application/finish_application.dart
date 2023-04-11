import 'package:crypto_stock/components/button/main_button.dart';
import 'package:crypto_stock/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FinishApplication extends StatelessWidget {
  const FinishApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.onSecondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.icon("success")),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 25),
                      child: Text(
                        "Congratulations !! Your order was succesfully placed",
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline1!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    )
                  ]),
            ),
          ),
          MainButton(
            text: "Back to home page",
            action: () => Get.offAndToNamed("main-view"),
          )
        ],
      ),
    );
  }
}
