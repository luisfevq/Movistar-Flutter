import 'package:dio/dio.dart';
import 'package:fluvistar/app/core/utils/values/api.dart';
import 'package:fluvistar/app/core/utils/values/const.dart';
import 'package:fluvistar/app/domain/model/authServiceOne.model.dart';
import 'package:fluvistar/app/domain/model/authServiceThre.model.dart';
import 'package:fluvistar/app/domain/model/authServiceTwo.model.dart';
import 'package:fluvistar/app/domain/model/baseResponse.model.dart';

class AuthService {
  Future<BaseResponseEntity> authenticationServiceOne() async {
    Response _response;
    Dio _dio = new Dio();

    BaseResponseEntity _baseResponseEntity = BaseResponseEntity();

    Map _data = {"username": "156339229", "password": "qwer1234"};

    Map<String, dynamic> _params = {"apikey": API_KEY};

    _dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';

    try {
      _response =
          await _dio.post(LOGIN_PASO1, data: _data, queryParameters: _params);
      if (_response.statusCode == 200) {
        _baseResponseEntity.status = true;
        _baseResponseEntity.statusCode = _response.statusCode;
        _baseResponseEntity.message = "Ok";
        _baseResponseEntity.data = AuthServiceOneModel.fromJson(_response.data);
      }
    } on DioError catch (e) {
      _baseResponseEntity.status = false;
      _baseResponseEntity.statusCode = e.response.statusCode;
      _baseResponseEntity.message = "Error";
      _baseResponseEntity.data = {};
    }
    return _baseResponseEntity;
  }

  Future<BaseResponseEntity> authenticationServiceTwo({String actToken}) async {
    Response _response;
    Dio _dio = new Dio();

    BaseResponseEntity _baseResponseEntity = BaseResponseEntity();

    Map _body = {
      "apikey": API_KEY,
      "act_token": actToken,
      "response_type": "code",
    };

    _dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';
    _dio.options.headers['accept'] = 'application/json';

    try {
      _response = await _dio.post(LOGIN_PASO2, data: _body);
      if (_response.statusCode == 200) {
        _baseResponseEntity.status = true;
        _baseResponseEntity.statusCode = _response.statusCode;
        _baseResponseEntity.message = "Ok";
        _baseResponseEntity.data = AuthServiceTwoModel.fromJson(_response.data);
      }
    } on DioError catch (e) {
      _baseResponseEntity.status = false;
      _baseResponseEntity.statusCode = e.response.statusCode;
      _baseResponseEntity.message = "Error";
      _baseResponseEntity.data = {};
    }
    return _baseResponseEntity;
  }

  Future<BaseResponseEntity> authenticationServiceThree(
      {String accessCode}) async {
    Response _response;
    Dio _dio = new Dio();

    BaseResponseEntity _baseResponseEntity = BaseResponseEntity();

    const ACCESS_LOGIN_CALLBACK = 'https://myloginOauth.net/auth-code';

    Map _body = {
      "client_id": API_KEY,
      "client_secret": CLIENT_SECRET,
      "code": accessCode,
      "redirect_uri": ACCESS_LOGIN_CALLBACK,
      "grant_type": "authorization_code",
    };

    _dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';
    _dio.options.headers['accept'] = 'application/json';

    try {
      _response = await _dio.post(LOGIN_PASO3, data: _body);
      if (_response.statusCode == 200) {
        _baseResponseEntity.status = true;
        _baseResponseEntity.statusCode = _response.statusCode;
        _baseResponseEntity.message = "Ok";
        _baseResponseEntity.data =
            AuthServiceThreModel.fromJson(_response.data);
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
