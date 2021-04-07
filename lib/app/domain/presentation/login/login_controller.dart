import 'package:flutter/material.dart';
import 'package:fluvistar/app/data/repository/api_repository.dart';
import 'package:fluvistar/app/data/repository/local_storage_repository.dart';
import 'package:fluvistar/app/data/request/login_request.dart';
import 'package:fluvistar/app/domain/excepcion/auth_exception.dart';
import 'package:get/get.dart';

enum LoginState {
  loading,
  initial,
}

enum PasswordIconState {
  visible,
  hidden,
}

class LoginController extends GetxController {
  final LocalStorageRepositoryInterface localStorageRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  LoginController({
    this.localStorageRepositoryInterface,
    this.apiRepositoryInterface,
  });

  final userTextController = TextEditingController();
  final passTextController = TextEditingController();

  var loginState = LoginState.initial.obs;
  var passwordIconState = PasswordIconState.hidden.obs;

  Future<bool> login() async {
    final user = userTextController.text;
    final pass = passTextController.text;

    try {
      loginState(LoginState.loading);
      final loginResponse = await apiRepositoryInterface.login(
        LoginRequest(user, pass),
      );

      await localStorageRepositoryInterface.saveToken(loginResponse.token);
      await localStorageRepositoryInterface.saveUser(loginResponse.user);

      return true;
    } on AuthException catch (_) {
      loginState(LoginState.initial);
      return false;
    }
  }

  changeStatePassword(PasswordIconState state) {
    if (state == PasswordIconState.visible) {
      passwordIconState(PasswordIconState.hidden);
    } else {
      passwordIconState(PasswordIconState.visible);
    }
  }
}
