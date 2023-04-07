import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import './default_input.dart';

class PhoneInput extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final name;
  final String hint;
  String label;
  final onChanged;
  final bool enabled;
  final onSubmitted;
  final onEditingComplete;
  final bool nextAction;
  final bool autofocus;
  final bool isRequired;
  final List<TextInputFormatter>? inputFormatter;
  final validator;
  final String initialValue;
  final FocusNode? focusNode;
  Widget? icon;
  PhoneInput(
      {required this.controller,
      required this.name,
      required this.hint,
      this.enabled = true,
      this.label = "",
      this.onChanged,
      this.onSubmitted,
      this.onEditingComplete,
      required this.nextAction,
      this.autofocus = false,
      this.validator,
      this.focusNode,
      this.initialValue = "",
      this.icon,
      this.inputFormatter,
      this.isRequired = false,
      Key? key})
      : super(key: key);

  @override
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  List<TextInputFormatter> _inputFormatter = [];
  @override
  void initState() {
    super.initState();
  }

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
                    keyboardType: TextInputType.phone,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hint,
                      hintStyle: Get.theme.textTheme.bodyText1!.copyWith(
                        color: Get.theme.hintColor,
                      ),
                      // fillColor: widget.enabled
                      //     ? Colors.transparent
                      //     : Get.theme.indicatorColor,
                      // filled: true,
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
