class BaseResponseEntity {
  String message;
  bool status;
  int statusCode;
  dynamic data;

  BaseResponseEntity({this.message, this.status, this.statusCode, this.data});
}
