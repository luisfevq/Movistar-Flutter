import 'package:dio/dio.dart';
import 'package:fluvistar/app/core/utils/values/api.dart';
import 'package:fluvistar/app/domain/model/baseResponse.model.dart';

class HomeService {
  Future<BaseResponseEntity> serviceCustomerProductUsage() async {
    Response _response;
    Dio _dio = new Dio();

    BaseResponseEntity _baseResponseEntity = BaseResponseEntity();

    // TODO: get phoneNumber localRepository
    String phoneNumber = "";

    Map<String, dynamic> _params = {
      "contractType": "Contrato",
      "resp": "summary",
      "state": "migrado",
      "type": "mobile",
    };

    _dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';

    try {
      _response = await _dio.get(PRODUCT_V2_USAGE + phoneNumber,
          queryParameters: _params);
      if (_response.statusCode == 200) {
        _baseResponseEntity.status = true;
        _baseResponseEntity.statusCode = _response.statusCode;
        _baseResponseEntity.message = "Ok";
        // _baseResponseEntity.data = BaseResponseEntity.fromJson(_response.data);
      }
    } on DioError catch (e) {
      _baseResponseEntity.status = false;
      _baseResponseEntity.statusCode = e.response.statusCode;
      _baseResponseEntity.message = "Error";
      _baseResponseEntity.data = {};
    }
    return _baseResponseEntity;
  }
}
