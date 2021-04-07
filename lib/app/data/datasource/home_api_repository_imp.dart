import 'package:fluvistar/app/data/repository/api_home_repository.dart';
import 'package:fluvistar/app/data/services/home.service.dart';
import 'package:fluvistar/app/domain/excepcion/auth_exception.dart';
import 'package:fluvistar/app/domain/model/baseResponse.model.dart';

class ApiHomeRepositoryImpl extends ApiHomeRepositoryInterface {
  @override
  Future<void> getCustomerProductUsage() async {
    var timeIni = DateTime.now();
    print("getCustomerProductUsage() timeIni: " + timeIni.toString());
    BaseResponseEntity respApiBase =
        await HomeService().serviceCustomerProductUsage();
    var _responseModel = respApiBase.data;
    var timeEnd = DateTime.now();
    print("getCustomerProductUsage() timeEnd: " + timeEnd.toString());
    if (_responseModel != null) {
      return;
    }
    throw AuthException();
  }

  @override
  Future<void> getCustomerProduct() {
    // Call API
    throw UnimplementedError();
  }
}
