import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextArea extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final name;
  // ignore: prefer_typing_uninitialized_variables
  final String hint;
  final Function? onChanged;
  final onSubmitted;
  final onEditingComplete;
  final bool nextAction;
  final bool isRequired;
  const TextArea(
      {required this.controller,
      required this.name,
      required this.hint,
      this.onChanged,
      this.onSubmitted,
      this.onEditingComplete,
      required this.nextAction,
      this.isRequired = false,
      Key? key})
      : super(key: key);

  @override
  _TextAreaState createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  int maxCnt = 1200;
  int _symbol = 1200;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Get.theme.hintColor,
            ),
            borderRadius: BorderRadius.circular(8),
            color: Get.theme.backgroundColor,
          ),
          child: FormBuilderTextField(
            textInputAction:
                widget.nextAction ? TextInputAction.next : TextInputAction.done,
            onChanged: (val) {
              setState(() {
                _symbol = maxCnt - val!.length;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(val);
              }
              ;
            },
            onSubmitted: widget.onSubmitted,
            onEditingComplete: widget.onEditingComplete,
            name: widget.name,
            maxLines: 5,
            style: Get.theme.textTheme.headline4!.copyWith(
              color: Get.theme.indicatorColor,
            ),
            keyboardType: TextInputType.text,
            controller: widget.controller,
            decoration: InputDecoration.collapsed(
              hintText: widget.hint,
              hintStyle: Get.theme.textTheme.headline4!,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            "осталось ${_symbol} символов",
            style: Get.theme.textTheme.bodyText2,
          ),
        )
      ],
    );
  }
}
