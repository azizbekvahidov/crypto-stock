import 'package:crypto_stock/components/button/main_button.dart';
import 'package:crypto_stock/components/default_appbar.dart';
import 'package:crypto_stock/components/draw_dotted.dart';
import '../../../components/input/inputs.dart';
import 'profile_page_controller.dart';
import 'package:crypto_stock/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey webViewKey = GlobalKey();
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    var appbar = DefaultAppbar();
    return GetBuilder<ProfilePageController>(
      init: ProfilePageController(),
      initState: (_) {},
      builder: (_profileController) {
        return Scaffold(
          appBar: appbar,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: Get.height - appbar.preferredSize.height - 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 75),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                  Assets.icon("profile", format: ".png")),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            "Add a profile photo",
                            style: Get.textTheme.headline1!
                                .copyWith(color: Get.theme.primaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 16),
                          child: Text(
                            "Add a profile photo so your friends know it's you!",
                            style: Get.textTheme.headline6!
                                .copyWith(color: Get.theme.colorScheme.primary),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4, bottom: 16),
                              child: InkWell(
                                onTap: () => Get.toNamed("application-list"),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color:
                                        Get.theme.colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(48),
                                  ),
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(
                                          Assets.icon("camera")),
                                    ),
                                    Text(
                                      "Мои заказы",
                                      style: Get.textTheme.headline4!.copyWith(
                                          color: Get.theme.primaryColor),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4, bottom: 16),
                              child: InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color:
                                        Get.theme.colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(48),
                                  ),
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(
                                          Assets.icon("gallery")),
                                    ),
                                    Text(
                                      "Мои данные",
                                      style: Get.textTheme.headline4!.copyWith(
                                          color: Get.theme.primaryColor),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
