import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SecondaryButton extends StatefulWidget {
  String text;
  Function() action;
  final Color? textColor;
  SecondaryButton({
    required this.text,
    required this.action,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.action(),
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 17),
          padding: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const RadialGradient(
              center: Alignment(-0.3, -98.8),
              focal: Alignment(-0.3, -0.4),
              radius: 50,
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
