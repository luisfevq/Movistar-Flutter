import 'package:fluvistar/app/data/services/auth.service.dart';
import 'package:fluvistar/app/domain/excepcion/auth_exception.dart';
import 'package:fluvistar/app/domain/model/authServiceOne.model.dart';
import 'package:fluvistar/app/domain/model/authServiceThre.model.dart';
import 'package:fluvistar/app/domain/model/authServiceTwo.model.dart';
import 'package:fluvistar/app/domain/model/baseResponse.model.dart';
import 'package:fluvistar/app/domain/model/user.dart';
import 'package:fluvistar/app/data/repository/api_repository.dart';
import 'package:fluvistar/app/data/response/login_response.dart';
import 'package:fluvistar/app/data/request/login_request.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    // API
    bool responseApiOK = true;
    if (responseApiOK) {
      return User(userName: 'Carlos Leiva');
    }

    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    // var timeIni = DateTime.now();
    // print("timeIni: " + timeIni.toString());
    BaseResponseEntity respApi1 =
        await AuthService().authenticationServiceOne();
    AuthServiceOneModel _authOne = respApi1.data;
    BaseResponseEntity respApi2 = await AuthService()
        .authenticationServiceTwo(actToken: _authOne.datos.actToken);
    AuthServiceTwoModel _authTwo = respApi2.data;
    BaseResponseEntity respApi3 = await AuthService()
        .authenticationServiceThree(accessCode: _authTwo.datos.code);
    AuthServiceThreModel _authThre = respApi3.data;
    // var timeEnd = DateTime.now();
    // print("timeEnd: " + timeEnd.toString());

    if (_authThre != null) {
      return LoginResponse(
        _authThre.accessToken,
        User(userName: _authThre.responseBknd.token.cliente.nombre),
      );
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('Remove data');
    return;
  }
}
