import 'package:crypto_stock/components/button/main_button.dart';
import 'package:crypto_stock/components/button/secondary_button.dart';
import 'package:crypto_stock/components/default_appbar.dart';
import 'package:crypto_stock/components/draw_dotted.dart';
import '../../../components/input/inputs.dart';
import 'application_view_controller.dart';
import 'package:crypto_stock/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ApplicationViewPage extends StatefulWidget {
  ApplicationViewPage({super.key});

  @override
  State<ApplicationViewPage> createState() => _ApplicationViewPageState();
}

class _ApplicationViewPageState extends State<ApplicationViewPage> {
  final GlobalKey webViewKey = GlobalKey();
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    var appbar = DefaultAppbar(
      title: "P2P",
      centerTitle: true,
    );
    return GetBuilder<ApplicationViewController>(
      init: ApplicationViewController(),
      initState: (_) {},
      builder: (_applicationController) {
        return Scaffold(
          appBar: appbar,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 6),
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Get.theme.colorScheme.secondary,
                          ),
                          child: Text(
                            "S",
                            style: Get.textTheme.caption!.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          "@SV",
                          style: Get.textTheme.caption!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Get.theme.primaryColor,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "RUB ",
                              style: Get.textTheme.headline6!.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              )),
                          TextSpan(
                              text: "65.30",
                              style: Get.textTheme.headline6!.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ))
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Локация ",
                              style: Get.textTheme.headline6!.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Get.theme.colorScheme.primary,
                              )),
                          TextSpan(
                              text: "Дубай",
                              style: Get.textTheme.headline6!.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Get.theme.primaryColor,
                              ))
                        ]),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: Get.width * 0.44,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                              color: Get.theme.colorScheme.primaryContainer,
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                      Assets.icon("gold_coin", format: ".png")),
                                  Text(
                                    "RUB",
                                    style: Get.textTheme.headline6,
                                  ),
                                  SvgPicture.asset(Assets.icon("down")),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                        ),
                        Expanded(
                          flex: 3,
                          child: NumberInput(
                            controller: null,
                            name: "name",
                            hint: "hint",
                            label: "",
                            nextAction: false,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Доступно ",
                              style: Get.textTheme.headline6!.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Get.theme.colorScheme.primary,
                              )),
                          TextSpan(
                              text: "10 AED",
                              style: Get.textTheme.headline6!.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Get.theme.primaryColor,
                              ))
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Лимиты ",
                              style: Get.textTheme.headline6!.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Get.theme.colorScheme.primary,
                              )),
                          TextSpan(
                              text: "10,000.00 - 114,257.50 сум",
                              style: Get.textTheme.headline6!.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Get.theme.primaryColor,
                              ))
                        ]),
                      ),
                    ),
                    SecondaryButton(
                      text: "Купить",
                      action: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text("Комментарий к заказу",
                          style: Get.textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Get.theme.primaryColor,
                          )),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "Learn how Andrew Medal's unconventional path to ",
                            style: Get.textTheme.headline2!
                                .copyWith(fontWeight: FontWeight.w700)),
                        TextSpan(
                          text: "entrepreneurship",
                          style: Get.textTheme.headline2!.copyWith(
                              color: Get.theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                            text: " made him a better businessman.",
                            style: Get.textTheme.headline2!
                                .copyWith(fontWeight: FontWeight.w700))
                      ]),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              ),
              CustomPaint(painter: DrawDottedhorizontalline()),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Text(
                  "Продам дирхамы, в районе дубай молл. Только личная встреча. Продам дирхамы, в районе дубай молл. Только личная встреча. Продам дирхамы, в районе дубай молл. Только личная встреча.",
                  style: Get.textTheme.headline6!.copyWith(
                    height: 1.7,
                    letterSpacing: 1.0,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
