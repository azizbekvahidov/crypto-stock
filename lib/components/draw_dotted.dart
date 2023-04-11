import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawDottedhorizontalline extends CustomPainter {
  double? start;
  double? end;
  Paint _paint = Paint();

  DrawDottedhorizontalline({this.start, this.end}) {
    _paint.color = Get.theme.hintColor; //dots color
    _paint.strokeWidth = 1; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = (start ?? -300); i < (end ?? 300); i = i + 15) {
      // 15 is space between dots
      if (i % 3 == 0)
        canvas.drawLine(Offset(i, 0.0), Offset(i + 7, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
