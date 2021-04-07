import 'package:flutter/material.dart';
import 'package:fluvistar/app/domain/presentation/splash/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SpashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Cargando..."),
      ),
    );
  }
}
