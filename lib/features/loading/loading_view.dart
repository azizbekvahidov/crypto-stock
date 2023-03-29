import '../../utils/assets_manager.dart';
// import 'package:rus_tili/widget/hear_beat_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(
        "assets/img/logo.png",
        width: context.width,
        height: context.height,
        fit: BoxFit.fill,
      ),
    );
  }
}
