import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import './default_input.dart';

class TextInput extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final name;
  // ignore: prefer_typing_uninitialized_variables
  final String hint;
  String label;
  final bool enabled;
  final onChanged;
  final validator;
  final onSubmitted;
  final maxLength;
  final onEditingComplete;
  final String initialValue;
  final bool nextAction;
  final bool autofocus;
  final FocusNode? focusNode;
  final bool isRequired;
  final List<TextInputFormatter>? inputFormatter;
  Widget? icon;
  TextInput(
      {this.controller,
      this.enabled = true,
      required this.name,
      required this.hint,
      this.label = "",
      this.onChanged,
      this.validator,
      this.maxLength,
      this.onSubmitted,
      this.onEditingComplete,
      this.initialValue = "",
      this.inputFormatter,
      this.focusNode,
      required this.nextAction,
      this.autofocus = false,
      this.isRequired = false,
      this.icon,
      Key? key})
      : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  List<TextInputFormatter> _inputFormatter = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.inputFormatter != null) {
      _inputFormatter = widget.inputFormatter!;
      _inputFormatter.add(LengthLimitingTextInputFormatter(widget.maxLength));
    } else {
      _inputFormatter.add(LengthLimitingTextInputFormatter(widget.maxLength));
    }
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
                    keyboardType: TextInputType.text,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(8.0),
                      // ),
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
