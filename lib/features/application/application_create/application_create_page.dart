import '../../../components/button/main_button.dart';
import '../../../components/default_appbar.dart';
import '../../../components/input/inputs.dart';
import 'application_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationCreatePage extends StatefulWidget {
  ApplicationCreatePage({super.key});

  @override
  State<ApplicationCreatePage> createState() => _ApplicationCreatePageState();
}

class _ApplicationCreatePageState extends State<ApplicationCreatePage> {
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
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: Get.height - appbar.preferredSize.height - 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            "Создание заявки",
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
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.all(4),
                          width: Get.width,
                          height: 53,
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
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
                                        color: _applicationController.type ==
                                                'buy'
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: _applicationController.type == 'sell'
                                        ? Get.theme.cardColor
                                        : Colors
                                            .transparent, //Get.theme.cardColor,
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: Text(
                                    "Sell",
                                    style: Get.textTheme.headline6!.copyWith(
                                        color: _applicationController.type ==
                                                'sell'
                                            ? Get.theme.scaffoldBackgroundColor
                                            : Get.theme.primaryColor),
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ),
                        DropdownInput(
                          result: "0",
                          name: "name",
                          hint: "hint",
                          options: [
                            {
                              "index": "0",
                              "value": "AED, Dirhams",
                            }
                          ],
                          label: "Валюта",
                        ),
                        NumberInput(
                          controller: null,
                          label: "Сумма",
                          name: "name",
                          hint: "25.000",
                          nextAction: true,
                        ),
                        NumberInput(
                          controller: null,
                          label: "Цена",
                          name: "name",
                          hint: "77.1",
                          nextAction: true,
                        ),
                        TextInput(
                          controller: null,
                          label: "Лимит",
                          name: "name",
                          initialValue:
                              "от 25.000                      -                  до 40.000",
                          hint:
                              "от 25.000                      -                  до 40.000",
                          nextAction: true,
                        ),
                        DropdownInput(
                          result: "0",
                          name: "name",
                          hint: "hint",
                          options: [
                            {
                              "index": "0",
                              "value": "Наличные",
                            }
                          ],
                          label: "Способ оплаты",
                        ),
                        DropdownInput(
                          result: "0",
                          name: "name",
                          hint: "hint",
                          options: [
                            {
                              "index": "0",
                              "value": "Локация",
                            }
                          ],
                          label: "Локация",
                        ),
                        TextInput(
                          controller: null,
                          label: "Комментарий к заказу",
                          name: "name",
                          hint: "Только личная встреча, в пределах Дхб",
                          nextAction: true,
                        ),
                      ]),
                  MainButton(
                    text: "Continue",
                    action: () {
                      Get.toNamed("application-create-finish");
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
