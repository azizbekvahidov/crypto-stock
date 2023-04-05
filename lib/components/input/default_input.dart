import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DefaultInput extends StatefulWidget {
  Widget child;
  bool isRequired;
  DefaultInput({this.isRequired = false, required this.child, Key? key})
      : super(key: key);

  @override
  _DefaultInputState createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      margin: const EdgeInsets.only(bottom: 15, top: 15),
      decoration: BoxDecoration(
        border: (widget.isRequired)
            ? Border.all(color: Get.theme.colorScheme.error)
            : Border.all(
                width: 2, color: Get.theme.colorScheme.secondaryContainer),
        color: Get.theme.backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: widget.child,
    );
  }
}
