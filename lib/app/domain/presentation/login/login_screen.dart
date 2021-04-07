import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluvistar/app/domain/presentation/login/login_controller.dart';
import 'package:fluvistar/app/domain/routes/movistar_navigator.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  void login() async {
    final result = await controller.login();
    if (result) {
      Get.offAllNamed(MovistarRoutes.home);
    } else {
      Get.snackbar('Error', 'Logon incorrect');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background_login.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Positioned(
                  top: Get.height * .06,
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/ilustracion_1.svg',
                      alignment: Alignment.center,
                      width: Get.width * .7,
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * .2,
                  child: Container(
                    width: Get.width * .9,
                    height: Get.height * .7,
                    padding: EdgeInsets.only(
                      top: Get.width * .04,
                      right: Get.height * .02,
                      bottom: Get.width * .04,
                      left: Get.height * .02,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF019DF4),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "¡Te damos la bienvenida!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                        Container(
                          width: Get.width,
                          height: Get.height * .07,
                          margin: EdgeInsets.only(top: Get.height * .02),
                          decoration: BoxDecoration(
                            color: Color(0xFF0B2739),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Center(
                            child: Text(
                              "Ingresa como invitado",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width,
                          margin: EdgeInsets.only(top: Get.height * .03),
                          child: Center(
                            child: Text(
                              "Si aún no tienes una cuenta, regístrate >",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width,
                          margin: EdgeInsets.only(top: Get.height * .03),
                          child: Row(
                            children: [
                              Container(
                                width: Get.width * .13,
                                height: 1,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "O ingresa con tus datos",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width * .13,
                                height: 1,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        buildInputsForms(),
                        Expanded(
                          child: SizedBox.shrink(),
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: login,
                              child: Container(
                                width: Get.width,
                                height: Get.height * .07,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    "Inicia sesión",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: Get.height * .02,
                                bottom: Get.height * .01,
                              ),
                              child: Center(
                                child: Text(
                                  "¿Olvidaste tu contraseña?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Obx(
              () {
                if (controller.loginState.value == LoginState.loading) {
                  return Container(
                    color: Colors.black54,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildInputsForms() {
    return Container(
      width: Get.width,
      height: Get.height * .22,
      margin: EdgeInsets.only(top: Get.height * .01),
      padding: EdgeInsets.all(Get.height * .01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Primer item input
          Container(
            width: Get.width,
            height: Get.height * .07,
            padding: EdgeInsets.only(
              left: Get.width * .03,
              right: Get.width * .03,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 33.0,
                  child: Icon(
                    Icons.person,
                    color: Colors.black54,
                    size: 26.0,
                  ),
                ),
                Container(
                  width: 45.0,
                  child: Center(
                    child: Text(
                      "Rut",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.userTextController,
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        left: 8,
                        bottom: 11,
                        top: 11,
                        right: 15,
                      ),
                      hintText: "1234567-9",
                      hintStyle: TextStyle(
                        fontSize: 19,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Segundo item input
          Container(
            width: Get.width,
            height: Get.height * .07,
            padding: EdgeInsets.only(
              left: Get.width * .03,
              right: Get.width * .03,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              children: [
                Container(
                  width: 33.0,
                  child: Icon(
                    Icons.lock_rounded,
                    color: Colors.black54,
                    size: 26.0,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => TextFormField(
                      controller: controller.passTextController,
                      obscureText: controller.passwordIconState.value ==
                              PasswordIconState.hidden
                          ? true
                          : false,
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                      ),
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                          left: 8,
                          bottom: 11,
                          top: 11,
                          right: 15,
                        ),
                        hintText: "Contraseña",
                        hintStyle: TextStyle(
                          fontSize: 19,
                          color: Colors.black87.withOpacity(.7),
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      await controller.changeStatePassword(
                          controller.passwordIconState.value);
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Obx(() {
                        if (controller.passwordIconState.value ==
                            PasswordIconState.hidden) {
                          return Icon(
                            Icons.visibility_off,
                            color: Colors.black26,
                            size: 26.0,
                          );
                        } else {
                          return Icon(
                            Icons.remove_red_eye,
                            color: Colors.black26,
                            size: 26.0,
                          );
                        }
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
