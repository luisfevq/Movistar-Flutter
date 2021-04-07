// Logica del negocio

import 'package:fluvistar/app/data/repository/api_repository.dart';
import 'package:fluvistar/app/data/repository/local_storage_repository.dart';
import 'package:fluvistar/app/domain/routes/movistar_navigator.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocalStorageRepositoryInterface localStorageRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  SplashController({
    this.localStorageRepositoryInterface,
    this.apiRepositoryInterface,
  });

  @override
  void onInit() {
    // El controller se crea, pero la vista aun no se renderiza
    super.onInit();
  }

  @override
  void onReady() {
    // La vista ya se renderizo
    print("onReady");
    validateSession();
    super.onReady();
  }

  void validateSession() async {
    final token = await localStorageRepositoryInterface.getToken();
    print("token =====");
    print(token);
    if (token == null) {
      print("[validateToken] if");
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localStorageRepositoryInterface.saveUser(user);
      Get.offAllNamed(MovistarRoutes.login);
    } else {
      print("[validateToken] else");
      Get.offNamed(MovistarRoutes.login);
    }
  }
}
