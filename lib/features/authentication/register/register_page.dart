import '../../../components/button/main_button.dart';
import '../../../components/default_appbar.dart';
import '../../../components/input/inputs.dart';
import '../../../utils/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

import '../../features.dart';

import '../../home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register_controller.dart';
import 'register_state.dart';

class RegisterPage extends StatelessWidget {
  static const String route = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _SignUpForm(),
    );
  }
}

class _SignUpForm extends StatefulWidget {
  @override
  __SignUpFormState createState() => __SignUpFormState();
}

class __SignUpFormState extends State<_SignUpForm> {
  final _controller = Get.put(LoginController());

  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    var appbar = DefaultAppbar();
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        "Регистрация",
                        style: Get.textTheme.headline1!
                            .copyWith(color: Get.theme.primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 16),
                      child: Text(
                        "This will be your Public handle",
                        style: Get.textTheme.headline6!
                            .copyWith(color: Get.theme.colorScheme.primary),
                      ),
                    ),
                    TextInput(
                      label: "Имя",
                      name: "name",
                      hint: "Your name",
                      nextAction: true,
                      icon: SvgPicture.asset(Assets.icon("user")),
                    ),
                    TextInput(
                      label: "Фамилия",
                      name: "name",
                      hint: "Your name",
                      nextAction: true,
                      icon: SvgPicture.asset(Assets.icon("user")),
                    ),
                    PasswordInput(
                        label: "Пароль",
                        name: "name",
                        hint: "*****************",
                        nextAction: true),
                    GooleAuth()
                  ]),
            ),
            MainButton(
              text: "Continue",
              action: () {},
            )
          ],
        ),
      ),
    );
  }
}
