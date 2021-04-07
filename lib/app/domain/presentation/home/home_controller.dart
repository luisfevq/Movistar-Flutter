import 'package:fluvistar/app/data/repository/api_home_repository.dart';
import 'package:fluvistar/app/data/repository/local_storage_repository.dart';
import 'package:fluvistar/app/domain/excepcion/auth_exception.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LocalStorageRepositoryInterface localStorageRepositoryInterface;
  final ApiHomeRepositoryInterface apiHomeRepositoryInterface;

  HomeController({
    this.localStorageRepositoryInterface,
    this.apiHomeRepositoryInterface,
  });

  Future<void> getProductV2CostumerProductUsage() async {
    try {
      final response =
          await apiHomeRepositoryInterface.getCustomerProductUsage();

      return true;
    } on AuthException catch (_) {
      return false;
    }
  }

  Future<void> getProductV2CostumerProduct() async {
    try {
      final response = await apiHomeRepositoryInterface.getCustomerProduct();

      return true;
    } on AuthException catch (_) {
      return false;
    }
  }
}
