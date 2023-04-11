import 'package:crypto_stock/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GooleAuth extends StatelessWidget {
  const GooleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      margin: const EdgeInsets.only(bottom: 15, top: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Get.theme.colorScheme.onBackground),
        color: Get.theme.backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: InkWell(
        onTap: () {
          print("asfasdfs");
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SvgPicture.asset(Assets.icon("google")),
          Text(
            "Авторизация через  Google",
            style: Get.textTheme.headline2,
          )
        ]),
      ),
    );
  }
}
