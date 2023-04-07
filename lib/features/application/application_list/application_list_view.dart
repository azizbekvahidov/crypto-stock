import 'package:crypto_stock/components/button/main_button.dart';
import 'package:crypto_stock/components/default_appbar.dart';
import 'package:crypto_stock/components/draw_dotted.dart';
import '../../../components/input/inputs.dart';
import './application_list_controller.dart';
import 'package:crypto_stock/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ApplicationListView extends StatefulWidget {
  ApplicationListView({super.key});

  @override
  State<ApplicationListView> createState() => _ApplicationListViewState();
}

class _ApplicationListViewState extends State<ApplicationListView> {
  final GlobalKey webViewKey = GlobalKey();
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    var appbar = DefaultAppbar(
      title: "P2P",
      centerTitle: true,
    );
    return GetBuilder<ApplicationListController>(
      init: ApplicationListController(),
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
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(4),
                      width: 225,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Row(children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              _applicationController.selectType(
                                  selectedType: "buy");
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _applicationController.type == 'buy'
                                    ? Get.theme.cardColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: Text(
                                "Buy",
                                style: Get.textTheme.headline6!.copyWith(
                                    color: _applicationController.type == 'buy'
                                        ? Get.theme.scaffoldBackgroundColor
                                        : Get.theme.primaryColor),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              _applicationController.selectType(
                                  selectedType: "sell");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: _applicationController.type == 'sell'
                                    ? Get.theme.cardColor
                                    : Colors.transparent, //Get.theme.cardColor,
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: Text(
                                "Sell",
                                style: Get.textTheme.headline6!.copyWith(
                                    color: _applicationController.type == 'sell'
                                        ? Get.theme.scaffoldBackgroundColor
                                        : Get.theme.primaryColor),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: NumberInput(
                            controller: null,
                            name: "name",
                            hint: "hint",
                            label: "Сумма",
                            nextAction: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                        ),
                        Expanded(
                          flex: 3,
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
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: SvgPicture.asset(
                            Assets.icon("change"),
                          ),
                        ),
                        Expanded(
                          flex: 3,
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
                                      Assets.icon("coin", format: ".png")),
                                  Text(
                                    "AED",
                                    style: Get.textTheme.headline6,
                                  ),
                                  SvgPicture.asset(Assets.icon("down")),
                                ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // Divider(),
              CustomPaint(painter: DrawDottedhorizontalline()),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            padding: const EdgeInsets.symmetric(vertical: 12),
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
                        ],
                      ),
                    ),
                    MainButton(
                      text: "Купить",
                      action: () => Get.toNamed("application-view"),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
