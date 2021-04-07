import 'package:fluvistar/app/data/request/login_request.dart';
import 'package:fluvistar/app/data/response/login_response.dart';
import 'package:fluvistar/app/domain/model/user.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<void> logout(String token);
  // Future<List<Offers>> getOffers();
}
