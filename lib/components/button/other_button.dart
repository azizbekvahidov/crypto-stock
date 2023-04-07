import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OtherButton extends StatefulWidget {
  String text;
  Function() action;
  final Color? textColor;
  OtherButton({
    required this.text,
    required this.action,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  _OtherButtonState createState() => _OtherButtonState();
}

class _OtherButtonState extends State<OtherButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.action(),
      child: Container(
          margin: const EdgeInsets.only(bottom: 17),
          padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            color: Get.theme.cardColor,
          ),
          child: Text(widget.text,
              style: Get.textTheme.headline4!
                  .copyWith(color: Get.theme.scaffoldBackgroundColor))),
    );
  }
}
