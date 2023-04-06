import '../../utils/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

import '../features/features.dart';

// import './network_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/globals.dart' as globals;

// ignore: must_be_immutable
class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? centerTitle;
  final Color? backgroundColor;
  final Color? textColor;
  final ancestorScaffold;
  bool hasDrawer;

  Function? searchFunc;
  MainAppbar(
      {this.title = "",
      this.centerTitle,
      this.backgroundColor,
      this.textColor,
      this.searchFunc,
      this.hasDrawer = false,
      this.ancestorScaffold,
      Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_control) {
      return AppBar(
        centerTitle: true,
        title: Text(
          "Лого",
          style: Get.textTheme.headline1,
        ),
        elevation: 0,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        leading: GestureDetector(
          onTap: () => Get.toNamed("register-page"),
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(Assets.icon("profile"), height: 40),
          ),
        ),
      );
    });
  }
}
