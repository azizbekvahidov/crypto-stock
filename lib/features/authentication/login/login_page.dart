import '../../../components/button/main_button.dart';
import '../../../components/default_appbar.dart';
import '../../../components/input/inputs.dart';
import '../../../utils/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

import '../../../features/features.dart';

import '../../home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  static const String route = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _SignInForm(),
    );
  }
}

class _SignInForm extends StatefulWidget {
  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
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
                        "Авторизация",
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
                      label: "Username, mail or number",
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
