import 'package:fluvistar/app/data/datasource/api_repository_impl.dart';
import 'package:fluvistar/app/data/datasource/home_api_repository_imp.dart';
import 'package:fluvistar/app/data/datasource/local_repository_impl.dart';
import 'package:fluvistar/app/data/repository/api_home_repository.dart';
import 'package:fluvistar/app/data/repository/api_repository.dart';
import 'package:fluvistar/app/data/repository/local_storage_repository.dart';
import 'package:get/instance_manager.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalStorageRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
    Get.lazyPut<ApiHomeRepositoryInterface>(() => ApiHomeRepositoryImpl());
  }
}
