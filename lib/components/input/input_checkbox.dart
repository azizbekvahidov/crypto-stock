import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// ignore: must_be_immutable
class InputCheckbox extends StatefulWidget {
  final controller;
  final name;
  // ignore: prefer_typing_uninitialized_variables
  final Widget title;
  final onChanged;
  final validator;
  final onSubmitted;
  final onEditingComplete;
  final bool initialValue;
  final bool nextAction;
  final bool isRequired;
  InputCheckbox({
    this.controller,
    required this.name,
    required this.title,
    this.onChanged,
    this.validator,
    this.onSubmitted,
    this.onEditingComplete,
    this.initialValue = false,
    required this.nextAction,
    this.isRequired = false,
    Key? key,
  }) : super(key: key);

  @override
  _InputCheckboxState createState() => _InputCheckboxState();
}

class _InputCheckboxState extends State<InputCheckbox> {
  // void radioAction(index) {
  //   setState(() {
  //     widget.result = index.toString();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: FormBuilderCheckbox(
        name: widget.name,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        title: widget.title,
      ),
    );
  }
}
