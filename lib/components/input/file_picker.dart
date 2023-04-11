import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilePickerInput extends StatefulWidget {
  String? filePath;
  File? file;
  Function onPick;
  FilePickerInput(
      {required this.onPick, required this.file, this.filePath, Key? key})
      : super(key: key);

  @override
  State<FilePickerInput> createState() => _FilePickerInputState();
}

class _FilePickerInputState extends State<FilePickerInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () async {
            widget.onPick();
          },
          child: ClipRRect(
            child: Container(
              alignment: Alignment.center,
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Get.theme.hintColor,
                  )),
              child: widget.file != null
                  ? Text(
                      widget.file!.path.split('/').last,
                      style: Get.theme.textTheme.headline2,
                      textAlign: TextAlign.center,
                    ) //Image.file(widget.file!)
                  : Text(
                      "choose file",
                      style: Get.theme.textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ),
        (widget.file != null || widget.filePath != null)
            ? ClipRRect(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: Get.width * 0.4,
                            minWidth: Get.width * 0.2),
                        child: widget.file != null
                            ? Image.file(widget.file!)
                            : ((widget.filePath != null)
                                ? Image.network(widget.filePath!)
                                : Container()),
                      )),
                ),
              )
            : Container(),
      ],
    );
  }
}
