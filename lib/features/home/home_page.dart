import 'package:flutter/material.dart';
import './home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const String route = "/";
  final _controller = Get.put(HomeController());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
