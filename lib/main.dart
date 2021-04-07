import 'package:flutter/material.dart';
import 'package:fluvistar/app/domain/presentation/main_binding.dart';
import 'package:fluvistar/app/domain/routes/movistar_navigator.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MovistarRoutes.splash,
      getPages: MovistarPages.pages,
      initialBinding: MainBinding(),
    ),
  );
}
