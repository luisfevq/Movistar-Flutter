import 'dart:convert';

AuthServiceTwoModel authServiceTwoModelFromJson(String str) =>
    AuthServiceTwoModel.fromJson(json.decode(str));

String authServiceTwoModelToJson(AuthServiceTwoModel data) =>
    json.encode(data.toJson());

class AuthServiceTwoModel {
  AuthServiceTwoModel({
    this.estado,
    this.datos,
  });

  Estado estado;
  Datos datos;

  factory AuthServiceTwoModel.fromJson(Map<String, dynamic> json) =>
      AuthServiceTwoModel(
        estado: json["estado"] == null ? null : Estado.fromJson(json["estado"]),
        datos: json["datos"] == null ? null : Datos.fromJson(json["datos"]),
      );

  Map<String, dynamic> toJson() => {
        "estado": estado == null ? null : estado.toJson(),
        "datos": datos == null ? null : datos.toJson(),
      };
}

class Datos {
  Datos({
    this.code,
  });

  String code;

  factory Datos.fromJson(Map<String, dynamic> json) => Datos(
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
      };
}

class Estado {
  Estado({
    this.codigoEstado,
    this.glosaEstado,
  });

  String codigoEstado;
  String glosaEstado;

  factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        codigoEstado:
            json["codigoEstado"] == null ? null : json["codigoEstado"],
        glosaEstado: json["glosaEstado"] == null ? null : json["glosaEstado"],
      );

  Map<String, dynamic> toJson() => {
        "codigoEstado": codigoEstado == null ? null : codigoEstado,
        "glosaEstado": glosaEstado == null ? null : glosaEstado,
      };
}
