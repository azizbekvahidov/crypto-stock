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
  final List<TextInputFormatter>? inputFormatter;
  final validator;
  final String initialValue;
  final FocusNode? focusNode;
  Widget? icon;
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
      this.validator,
      this.focusNode,
      this.initialValue = "",
      this.icon,
      this.inputFormatter,
      Key? key})
      : super(key: key);

  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  List<TextInputFormatter> _inputFormatter = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultInput(
          child: SizedBox(
            height: 48,
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: FormBuilderTextField(
                    textAlignVertical: TextAlignVertical.top,
                    focusNode: widget.focusNode,
                    autofocus: widget.autofocus,
                    enabled: widget.enabled,
                    initialValue:
                        widget.initialValue != "" ? widget.initialValue : null,
                    validator: widget.validator,
                    textInputAction: widget.nextAction
                        ? TextInputAction.next
                        : TextInputAction.done,
                    onChanged: widget.onChanged,
                    onSubmitted: (value) => widget.onSubmitted,
                    onEditingComplete: widget.onEditingComplete,
                    name: widget.name,
                    maxLines: 1,
                    style: Get.theme.textTheme.bodyText1,
                    inputFormatters: _inputFormatter,
                    keyboardType: TextInputType.number,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hint,
                      hintStyle: Get.theme.textTheme.bodyText1!.copyWith(
                        color: Get.theme.hintColor,
                      ),
                    ),
                  ),
                ),
                widget.icon != null
                    ? Expanded(flex: 1, child: widget.icon!)
                    : Container(),
              ],
            ),
          ),
        ),
        widget.label != ""
            ? Positioned(
                left: 18,
                top: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  color: Get.theme.scaffoldBackgroundColor,
                  child: Text(
                    widget.label,
                    style: Get.textTheme.bodyText1,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
