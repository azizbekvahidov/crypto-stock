import '../features/features.dart';

// import './network_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/globals.dart' as globals;

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? centerTitle;
  final Color? backgroundColor;
  final Color? textColor;
  final ancestorScaffold;
  bool hasDrawer;

  Function? searchFunc;
  CustomAppbar(
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
        actions: [],
        elevation: 1,
        iconTheme: IconThemeData(color: Get.theme.indicatorColor),
        backgroundColor: Get.theme.backgroundColor,
        title: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hasDrawer
                  ? IconButton(
                      icon: Icon(Icons.menu),
                      // 4. open the drawer if we have one
                      onPressed: hasDrawer
                          ? () => ancestorScaffold!.openDrawer()
                          : null,
                    )
                  : Container(),
              Container(
                child: Text(
                  _control.title,
                  // style: TextStyle(
                  //     fontFamily: globals.font,
                  //     fontSize: 18,
                  //     color: globals.mainColor),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
