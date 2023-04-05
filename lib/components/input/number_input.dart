import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import './default_input.dart';

class NumberInput extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final bool enabled;
  final name;
  // ignore: prefer_typing_uninitialized_variables
  final String hint;
  String label;
  final maxLength;
  final onChanged;
  final onSubmitted;
  final onEditingComplete;
  final bool autofocus;
  final bool nextAction;
  final bool isRequired;
  NumberInput(
      {required this.controller,
      this.enabled = true,
      required this.name,
      this.label = "",
      required this.hint,
      this.maxLength,
      this.onChanged,
      this.autofocus = false,
      this.onSubmitted,
      this.onEditingComplete,
      required this.nextAction,
      this.isRequired = false,
      Key? key})
      : super(key: key);

  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != ""
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.label,
                  style: Get.textTheme.bodyText1,
                ),
              )
            : Container(),
        SizedBox(
          height: 48,
          child: FormBuilderTextField(
            textAlignVertical: TextAlignVertical.bottom,
            textInputAction:
                widget.nextAction ? TextInputAction.next : TextInputAction.done,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            onEditingComplete: widget.onEditingComplete,
            name: widget.name,
            autofocus: widget.autofocus,
            inputFormatters: [
              new LengthLimitingTextInputFormatter(widget.maxLength),
              FilteringTextInputFormatter.deny(RegExp(r"[^\d.]+")),
            ],
            maxLines: 1,
            style: Get.theme.textTheme.bodyText1,
            keyboardType: TextInputType.number,
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              hintText: widget.hint,
              hintStyle: Get.theme.textTheme.bodyText1!.copyWith(
                color: Get.theme.hintColor,
              ),
              fillColor:
                  widget.enabled ? Colors.transparent : Get.theme.hintColor,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
