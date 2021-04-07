import 'package:fluvistar/app/domain/model/user.dart';

class LoginResponse {
  final String token;
  final User user;

  LoginResponse(this.token, this.user);
}
