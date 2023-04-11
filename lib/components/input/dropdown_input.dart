import '../../utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import './default_input.dart';

class DropdownInput extends StatefulWidget {
  final name;
  // ignore: prefer_typing_uninitialized_variables
  final String hint;
  final onChanged;
  String label;
  final validator;
  final onTap;
  final List options;
  final result;
  final bool isRequired;
  DropdownInput(
      {required this.name,
      required this.hint,
      this.onChanged,
      this.label = "",
      this.validator,
      this.onTap,
      required this.options,
      this.result = "",
      this.isRequired = false,
      Key? key})
      : super(key: key);

  @override
  _DropdownInputState createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultInput(
          isRequired: widget.isRequired,
          child: SizedBox(
            height: 48,
            child: FormBuilderDropdown(
              validator: widget.validator,
              initialValue: widget.result == "" ? null : widget.result,
              icon: SvgPicture.asset(Assets.icon("down")),
              items: widget.options.map((option) {
                return DropdownMenuItem(
                  value: option["index"],
                  child: Text('${option["value"]}'),
                );
              }).toList(),
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              name: widget.name,
              style: Get.theme.textTheme.headline4!.copyWith(
                color: Get.theme.primaryColor,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hint,
                hintStyle: Get.theme.textTheme.bodyText1!.copyWith(
                  color: Get.theme.hintColor,
                ),
              ),
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
