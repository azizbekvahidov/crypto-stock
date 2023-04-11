import 'package:crypto_stock/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import './default_input.dart';

class PasswordInput extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final name;
  // ignore: prefer_typing_uninitialized_variables
  final String hint;
  final bool enabled;
  final onChanged;
  final validator;
  final onSubmitted;
  final maxLength;
  final onEditingComplete;
  final String initialValue;
  final bool nextAction;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool isRequired;
  final String label;
  final List<TextInputFormatter>? inputFormatter;
  const PasswordInput(
      {this.controller,
      this.enabled = true,
      required this.name,
      required this.hint,
      this.onChanged,
      this.focusNode,
      this.validator,
      this.maxLength,
      this.onSubmitted,
      this.onEditingComplete,
      this.initialValue = "",
      this.inputFormatter,
      required this.nextAction,
      this.autofocus = false,
      this.isRequired = false,
      this.label = "",
      Key? key})
      : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  List<TextInputFormatter> _inputFormatter = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.inputFormatter != null) {
      _inputFormatter = widget.inputFormatter!;
      _inputFormatter
          .add(new LengthLimitingTextInputFormatter(widget.maxLength));
    } else {
      _inputFormatter
          .add(new LengthLimitingTextInputFormatter(widget.maxLength));
    }
  }

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.start,
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
                    obscuringCharacter: "*",
                    obscureText: !show,
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
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      child: show
                          ? SvgPicture.asset(Assets.icon("eye"))
                          : SvgPicture.asset(Assets.icon("eye")),
                    )),
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
