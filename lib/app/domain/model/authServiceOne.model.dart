import 'dart:convert';

AuthServiceOneModel authServiceOneModelFromJson(String str) =>
    AuthServiceOneModel.fromJson(json.decode(str));

String authServiceOneModelToJson(AuthServiceOneModel data) =>
    json.encode(data.toJson());

class AuthServiceOneModel {
  AuthServiceOneModel({
    this.estado,
    this.datos,
  });

  Estado estado;
  Datos datos;

  factory AuthServiceOneModel.fromJson(Map<String, dynamic> json) =>
      AuthServiceOneModel(
        estado: json["estado"] == null ? null : Estado.fromJson(json["estado"]),
        datos: json["datos"] == null ? null : Datos.fromJson(json["datos"]),
      );

  Map<String, dynamic> toJson() => {
        "estado": estado == null ? null : estado.toJson(),
        "datos": datos == null ? null : datos.toJson(),
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

class Datos {
  Datos({
    this.actToken,
  });

  String actToken;

  factory Datos.fromJson(Map<String, dynamic> json) => Datos(
        actToken: json["act_token"] == null ? null : json["act_token"],
      );

  Map<String, dynamic> toJson() => {
        "act_token": actToken == null ? null : actToken,
      };
}
