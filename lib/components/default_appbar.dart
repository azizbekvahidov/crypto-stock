import 'package:crypto_stock/utils/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

import '../features/features.dart';

// import './network_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/globals.dart' as globals;

// ignore: must_be_immutable
class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? centerTitle;
  final Color? backgroundColor;
  final Color? textColor;
  final ancestorScaffold;
  bool hasDrawer;

  Function? searchFunc;
  DefaultAppbar(
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
        automaticallyImplyLeading: false,
        actions: [],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              decoration: BoxDecoration(
                  color: Get.theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20)),
              child: SvgPicture.asset(Assets.icon("left"))),
          //replace with our own icon data.
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Get.theme.indicatorColor),
        backgroundColor: Get.theme.backgroundColor,
        title: Text(
          title ?? "",
          style: Get.textTheme.headline2!.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    });
  }
}
