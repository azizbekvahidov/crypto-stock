import 'package:crypto_stock/components/button/main_button.dart';
import 'package:crypto_stock/components/button/other_button.dart';
import 'package:crypto_stock/components/default_appbar.dart';
import '../../../components/input/inputs.dart';
import 'application_create_controller.dart';
import 'package:crypto_stock/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ApplicationCreateFinishPage extends StatefulWidget {
  ApplicationCreateFinishPage({super.key});

  @override
  State<ApplicationCreateFinishPage> createState() =>
      _ApplicationCreateFinishPageState();
}

class _ApplicationCreateFinishPageState
    extends State<ApplicationCreateFinishPage> {
  final GlobalKey webViewKey = GlobalKey();
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    var appbar = DefaultAppbar();
    return GetBuilder<ApplicationCreateController>(
      init: ApplicationCreateController(),
      initState: (_) {},
      builder: (_applicationController) {
        return Scaffold(
          appBar: appbar,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            "Ваш ник",
                            style: Get.textTheme.headline1!
                                .copyWith(color: Get.theme.primaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                          ),
                          child: Text(
                            "This will be your Public handle",
                            style: Get.textTheme.headline6!
                                .copyWith(color: Get.theme.colorScheme.primary),
                          ),
                        ),
                        TextInput(
                          controller: null,
                          label: "Username",
                          name: "name",
                          hint: "Your name",
                          nextAction: true,
                          icon: SvgPicture.asset(Assets.icon("user")),
                        ),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OtherButton(
                      text: "Пропустить",
                      action: () => Get.toNamed("finish-application"),
                    ),
                    MainButton(
                      text: "Continue",
                      action: () => Get.toNamed("finish-application"),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
