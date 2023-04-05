import 'package:crypto_stock/components/button/main_button.dart';
import 'package:crypto_stock/components/default_appbar%20copy.dart';
import 'package:crypto_stock/components/input/google_auth.dart';
import 'package:crypto_stock/components/input/password_input.dart';
import 'package:crypto_stock/components/input/text_input.dart';

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
              child: Column(children: [
                TextInput(
                    label: "Username, mail or number",
                    name: "name",
                    hint: "Your name",
                    nextAction: true),
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
