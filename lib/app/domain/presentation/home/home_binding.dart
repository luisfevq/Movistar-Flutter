import 'package:fluvistar/app/domain/presentation/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        localStorageRepositoryInterface: Get.find(),
        apiHomeRepositoryInterface: Get.find(),
      ),
    );
  }
}
