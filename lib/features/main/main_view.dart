import 'package:crypto_stock/components/main_appbar.dart';
import 'package:crypto_stock/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  String url;
  MainView({this.url = "", super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final GlobalKey webViewKey = GlobalKey();
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    var appbar = MainAppbar();
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Container(
                width: Get.width,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: const RadialGradient(
                    center: Alignment(-0.3, -5.5),
                    focal: Alignment(-0.3, -0.4),
                    radius: 3.4,
                    colors: [
                      Color(0xff23C562),
                      Color(0xff77D21C),
                      Color(0xff17DCD0),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -90,
                      right: -60,
                      child: Container(
                        width: 206,
                        height: 206,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(255, 255, 255, 0.2)),
                          borderRadius: BorderRadius.circular(200),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.4),
                              Color.fromRGBO(255, 255, 255, 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -110,
                      right: -30,
                      child: Container(
                        width: 206,
                        height: 206,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(255, 255, 255, 0.2)),
                          borderRadius: BorderRadius.circular(200),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.4),
                              Color.fromRGBO(255, 255, 255, 0),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed("application-list"),
                        child: Column(children: [
                          SvgPicture.asset(
                            Assets.icon("buy"),
                            width: Get.width * 0.17,
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          Text(
                            "Купить",
                            style: Get.textTheme.headline6,
                          ),
                        ]),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed("application-list"),
                        child: Column(children: [
                          SvgPicture.asset(
                            Assets.icon("sell"),
                            width: Get.width * 0.17,
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          Text(
                            "Продать",
                            style: Get.textTheme.headline6,
                          ),
                        ]),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed("application-list"),
                        child: Column(children: [
                          SvgPicture.asset(
                            Assets.icon("p2p"),
                            width: Get.width * 0.17,
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          Text(
                            "P2P",
                            style: Get.textTheme.headline6,
                          ),
                        ]),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed("application-create"),
                        child: Column(children: [
                          SvgPicture.asset(
                            Assets.icon("add"),
                            width: Get.width * 0.17,
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          Text(
                            "Добавить",
                            style: Get.textTheme.headline6,
                          ),
                        ]),
                      ),
                    ]),
              ),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 4,
                runSpacing: 13,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed("application-list"),
                    child: Container(
                      width: Get.width * 0.44,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: Get.theme.colorScheme.primaryContainer,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                                Assets.icon("gold_coin", format: ".png")),
                            Text(
                              "RUB - AED",
                              style: Get.textTheme.headline6,
                            ),
                            SvgPicture.asset(Assets.icon("down")),
                          ]),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.44,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: Get.theme.colorScheme.primaryContainer,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Assets.icon("gold_coin", format: ".png")),
                          Text(
                            "AED - RUB",
                            style: Get.textTheme.headline6,
                          ),
                          SvgPicture.asset(Assets.icon("down")),
                        ]),
                  ),
                  Container(
                    width: Get.width * 0.44,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: Get.theme.colorScheme.primaryContainer,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Assets.icon("coin", format: ".png")),
                          Text(
                            "RUB - USDT",
                            style: Get.textTheme.headline6,
                          ),
                          SvgPicture.asset(Assets.icon("down")),
                        ]),
                  ),
                  Container(
                    width: Get.width * 0.44,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: Get.theme.colorScheme.primaryContainer,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Assets.icon("coin", format: ".png")),
                          Text(
                            "RUB - USDT",
                            style: Get.textTheme.headline6,
                          ),
                          SvgPicture.asset(Assets.icon("down")),
                        ]),
                  ),
                ],
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      height: 64,
                      width: Get.width * 0.7,
                      decoration: BoxDecoration(
                        color: Get.theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 16,
                              offset: Offset(0, 12),
                              color: Color.fromRGBO(194, 194, 194, 0.15))
                        ],
                        border: Border.all(
                          width: 1,
                          color: Get.theme.colorScheme.primaryContainer,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                print("home");
                              },
                              child: SvgPicture.asset(Assets.icon("home"))),
                          InkWell(
                              onTap: () {
                                print("browse");
                              },
                              child: SvgPicture.asset(Assets.icon("browse"))),
                          InkWell(
                              onTap: () {
                                print("chat");
                              },
                              child: SvgPicture.asset(Assets.icon("chat"))),
                          InkWell(
                              onTap: () {
                                Get.toNamed("profile-page");
                              },
                              child: SvgPicture.asset(Assets.icon("pocket"))),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed("application-create"),
                      child: Container(
                        padding: const EdgeInsets.all(21),
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: const RadialGradient(
                            center: Alignment(-0.7, -5.8),
                            focal: Alignment(-0.3, -0.4),
                            radius: 3.4,
                            colors: [
                              Color(0xff23C562),
                              Color(0xff77D21C),
                              Color(0xff17DCD0),
                            ],
                          ),
                        ),
                        child: SvgPicture.asset(Assets.icon("plus")),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
