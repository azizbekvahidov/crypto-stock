import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MainButton extends StatefulWidget {
  String text;
  Function() action;
  final Color? textColor;
  MainButton({
    required this.text,
    required this.action,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: const EdgeInsets.only(bottom: 17),
          padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
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
          child: Text(widget.text, style: Get.textTheme.headline4)),
    );
  }
}
