import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/base_utils.dart';

import '../../features.dart';

class LoginController extends GetxController with BaseUtils {
  final AuthenticationController _authenticationController = Get.find();

  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;
  TextEditingController passwordController = TextEditingController();

  String? appType;
  @override
  onReady() async {
    super.onReady();
  }

  Future<void> login(
      {required String username, required String password}) async {
    _loginStateStream.value = LoginLoading();

    try {
      await _authenticationController.signIn(
          username: username, password: password);
      _loginStateStream.value = LoginState();
    } on AuthenticationException catch (e) {
      _loginStateStream.value = LoginFailure(error: e.message);
    }
  }

  pressDigits({required String digit}) {
    passwordController.text += digit;
    update();
  }

  removeDigits() {
    if (passwordController.text != "") {
      passwordController.text = passwordController.text
          .substring(0, passwordController.text.length - 1);
      update();
    }
  }

  deleteDigits() {
    passwordController.text = "";
    update();
  }

  Future<void> signIn() async {
    _loginStateStream.value = LoginLoading();

    try {
      await _authenticationController.signIn(
          username: 'aziz', password: 'Dr@g0nball');
      _loginStateStream.value = LoginState();
    } on AuthenticationException catch (e) {
      _loginStateStream.value = LoginFailure(error: e.message);
    }
  }
}
