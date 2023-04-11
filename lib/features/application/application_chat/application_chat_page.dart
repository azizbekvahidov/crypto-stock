import 'package:crypto_stock/components/button/main_button.dart';
import 'package:crypto_stock/components/button/secondary_button.dart';
import 'package:crypto_stock/components/default_appbar.dart';
import 'package:crypto_stock/components/draw_dotted.dart';
import '../../../components/input/inputs.dart';
import 'application_chat_controller.dart';
import 'package:crypto_stock/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ApplicationChatPage extends StatefulWidget {
  ApplicationChatPage({super.key});

  @override
  State<ApplicationChatPage> createState() => _ApplicationChatPageState();
}

class _ApplicationChatPageState extends State<ApplicationChatPage> {
  final GlobalKey webViewKey = GlobalKey();
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    var appbar = DefaultAppbar(
      title: "P2P",
      centerTitle: true,
    );
    return GetBuilder<ApplicationChatController>(
      init: ApplicationChatController(),
      initState: (_) {},
      builder: (_applicationController) {
        return Scaffold(
          appBar: appbar,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        "Заказ выполняетя",
                        style: Get.textTheme.headline1!
                            .copyWith(color: Get.theme.primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 16),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Доступные ",
                            style: Get.textTheme.headline6!
                                .copyWith(color: Get.theme.colorScheme.primary),
                          ),
                          TextSpan(
                            text: "10 USDT",
                            style: Get.textTheme.headline6!
                                .copyWith(color: Get.theme.colorScheme.surface),
                          ),
                        ]),
                      ),
                    ),
                    Center(
                        child:
                            CustomPaint(painter: DrawDottedhorizontalline())),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    ),
                    SecondaryButton(
                      text: "Завершить сделку",
                      action: () => Get.toNamed("finish-application"),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Divider(
                    color: Get.theme.primaryColor,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 40),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                Assets.icon("chat-camera"),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ChatInput(
                                name: "name",
                                hint: "Write a comment",
                                nextAction: false,
                                icon: InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    Assets.icon("user-smile"),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
