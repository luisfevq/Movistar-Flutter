import 'dart:convert';

AuthServiceThreModel authServiceThreModelFromJson(String str) =>
    AuthServiceThreModel.fromJson(json.decode(str));

String authServiceThreModelToJson(AuthServiceThreModel data) =>
    json.encode(data.toJson());

class AuthServiceThreModel {
  AuthServiceThreModel({
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.developerApp,
    this.mcsstoken,
    this.dv,
    this.rut,
    this.responseBknd,
  });

  String accessToken;
  String refreshToken;
  String expiresIn;
  String scope;
  String developerApp;
  String mcsstoken;
  String dv;
  String rut;
  ResponseBknd responseBknd;

  factory AuthServiceThreModel.fromJson(Map<String, dynamic> json) =>
      AuthServiceThreModel(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        refreshToken:
            json["refresh_token"] == null ? null : json["refresh_token"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        scope: json["scope"] == null ? null : json["scope"],
        developerApp:
            json["developer_app"] == null ? null : json["developer_app"],
        mcsstoken: json["mcsstoken"] == null ? null : json["mcsstoken"],
        dv: json["dv"] == null ? null : json["dv"],
        rut: json["rut"] == null ? null : json["rut"],
        responseBknd: json["responseBknd"] == null
            ? null
            : ResponseBknd.fromJson(json["responseBknd"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken == null ? null : accessToken,
        "refresh_token": refreshToken == null ? null : refreshToken,
        "expires_in": expiresIn == null ? null : expiresIn,
        "scope": scope == null ? null : scope,
        "developer_app": developerApp == null ? null : developerApp,
        "mcsstoken": mcsstoken == null ? null : mcsstoken,
        "dv": dv == null ? null : dv,
        "rut": rut == null ? null : rut,
        "responseBknd": responseBknd == null ? null : responseBknd.toJson(),
      };
}

class ResponseBknd {
  ResponseBknd({
    this.token,
  });

  Token token;

  factory ResponseBknd.fromJson(Map<String, dynamic> json) => ResponseBknd(
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token.toJson(),
      };
}

class Token {
  Token({
    this.codError,
    this.codDesc,
    this.cliente,
  });

  String codError;
  String codDesc;
  Cliente cliente;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        codError: json["codError"] == null ? null : json["codError"],
        codDesc: json["codDesc"] == null ? null : json["codDesc"],
        cliente:
            json["cliente"] == null ? null : Cliente.fromJson(json["cliente"]),
      );

  Map<String, dynamic> toJson() => {
        "codError": codError == null ? null : codError,
        "codDesc": codDesc == null ? null : codDesc,
        "cliente": cliente == null ? null : cliente.toJson(),
      };
}

class Cliente {
  Cliente({
    this.id,
    this.nombre,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.segmento,
    this.contacto,
    this.productos,
  });

  Id id;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  String segmento;
  Contacto contacto;
  Productos productos;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"] == null ? null : Id.fromJson(json["id"]),
        nombre: json["nombre"] == null ? null : json["nombre"],
        apellidoPaterno:
            json["apellido_paterno"] == null ? null : json["apellido_paterno"],
        apellidoMaterno:
            json["apellido_materno"] == null ? null : json["apellido_materno"],
        segmento: json["segmento"] == null ? null : json["segmento"],
        contacto: json["contacto"] == null
            ? null
            : Contacto.fromJson(json["contacto"]),
        productos: json["productos"] == null
            ? null
            : Productos.fromJson(json["productos"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id.toJson(),
        "nombre": nombre == null ? null : nombre,
        "apellido_paterno": apellidoPaterno == null ? null : apellidoPaterno,
        "apellido_materno": apellidoMaterno == null ? null : apellidoMaterno,
        "segmento": segmento == null ? null : segmento,
        "contacto": contacto == null ? null : contacto.toJson(),
        "productos": productos == null ? null : productos.toJson(),
      };
}

class Contacto {
  Contacto({
    this.mail,
    this.sms,
    this.preferido,
  });

  String mail;
  String sms;
  String preferido;

  factory Contacto.fromJson(Map<String, dynamic> json) => Contacto(
        mail: json["mail"] == null ? null : json["mail"],
        sms: json["sms"] == null ? null : json["sms"],
        preferido: json["preferido"] == null ? null : json["preferido"],
      );

  Map<String, dynamic> toJson() => {
        "mail": mail == null ? null : mail,
        "sms": sms == null ? null : sms,
        "preferido": preferido == null ? null : preferido,
      };
}

class Id {
  Id({
    this.rut,
    this.dv,
  });

  String rut;
  String dv;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        rut: json["rut"] == null ? null : json["rut"],
        dv: json["dv"] == null ? null : json["dv"],
      );

  Map<String, dynamic> toJson() => {
        "rut": rut == null ? null : rut,
        "dv": dv == null ? null : dv,
      };
}

class Productos {
  Productos({
    this.producto,
  });

  List<Producto> producto;

  factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        producto: json["producto"] == null
            ? null
            : List<Producto>.from(
                json["producto"].map((x) => Producto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "producto": producto == null
            ? null
            : List<dynamic>.from(producto.map((x) => x.toJson())),
      };
}

class Producto {
  Producto({
    this.id,
    this.tipo,
    this.rol,
    this.seleccion,
    this.preferido,
    this.idclie,
    this.idcuen,
    this.rutTitular,
    this.codsegmento,
    this.codcategoria,
    this.tipocontrato,
    this.vigenteDesde,
    this.codSubSeg,
    this.descSubSeg,
    this.tipoContratoOri,
    this.permiso,
    this.estadomigrado,
    this.idcontacto,
  });

  String id;
  String tipo;
  String rol;
  String seleccion;
  String preferido;
  String idclie;
  String idcuen;
  String rutTitular;
  String codsegmento;
  String codcategoria;
  String tipocontrato;
  String vigenteDesde;
  String codSubSeg;
  String descSubSeg;
  String tipoContratoOri;
  Permiso permiso;
  String estadomigrado;
  String idcontacto;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"] == null ? null : json["id"],
        tipo: json["tipo"] == null ? null : json["tipo"],
        rol: json["rol"] == null ? null : json["rol"],
        seleccion: json["seleccion"] == null ? null : json["seleccion"],
        preferido: json["preferido"] == null ? null : json["preferido"],
        idclie: json["idclie"] == null ? null : json["idclie"],
        idcuen: json["idcuen"] == null ? null : json["idcuen"],
        rutTitular: json["rut_titular"] == null ? null : json["rut_titular"],
        codsegmento: json["codsegmento"] == null ? null : json["codsegmento"],
        codcategoria:
            json["codcategoria"] == null ? null : json["codcategoria"],
        tipocontrato:
            json["tipocontrato"] == null ? null : json["tipocontrato"],
        vigenteDesde:
            json["vigente-desde"] == null ? null : json["vigente-desde"],
        codSubSeg: json["cod_sub_seg"] == null ? null : json["cod_sub_seg"],
        descSubSeg: json["desc_sub_seg"] == null ? null : json["desc_sub_seg"],
        tipoContratoOri:
            json["tipoContratoOri"] == null ? null : json["tipoContratoOri"],
        permiso:
            json["permiso"] == null ? null : Permiso.fromJson(json["permiso"]),
        estadomigrado:
            json["estadomigrado"] == null ? null : json["estadomigrado"],
        idcontacto: json["idcontacto"] == null ? null : json["idcontacto"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "tipo": tipo == null ? null : tipo,
        "rol": rol == null ? null : rol,
        "seleccion": seleccion == null ? null : seleccion,
        "preferido": preferido == null ? null : preferido,
        "idclie": idclie == null ? null : idclie,
        "idcuen": idcuen == null ? null : idcuen,
        "rut_titular": rutTitular == null ? null : rutTitular,
        "codsegmento": codsegmento == null ? null : codsegmento,
        "codcategoria": codcategoria == null ? null : codcategoria,
        "tipocontrato": tipocontrato == null ? null : tipocontrato,
        "vigente-desde": vigenteDesde == null ? null : vigenteDesde,
        "cod_sub_seg": codSubSeg == null ? null : codSubSeg,
        "desc_sub_seg": descSubSeg == null ? null : descSubSeg,
        "tipoContratoOri": tipoContratoOri == null ? null : tipoContratoOri,
        "permiso": permiso == null ? null : permiso.toJson(),
        "estadomigrado": estadomigrado == null ? null : estadomigrado,
        "idcontacto": idcontacto == null ? null : idcontacto,
      };
}

class Permiso {
  Permiso({
    this.perfil,
  });

  String perfil;

  factory Permiso.fromJson(Map<String, dynamic> json) => Permiso(
        perfil: json["perfil"] == null ? null : json["perfil"],
      );

  Map<String, dynamic> toJson() => {
        "perfil": perfil == null ? null : perfil,
      };
}
