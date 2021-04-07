import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluvistar/app/domain/global_widgets/bottom_nav.dart';
import 'package:fluvistar/app/domain/presentation/home/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Controller());
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: ListView(
            children: [
              // Carrousel
              carrouselWidget(controller),
              // Content
              contentWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavMovistar(
        textoHome: "Resumen",
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Color(0xFF5CB615),
          borderRadius: BorderRadius.circular(50),
        ),
        child: SvgPicture.asset(
          'assets/icon_pay_reload.svg',
          alignment: Alignment.center,
          width: 10,
          height: 10,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget carrouselWidget(Controller controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      color: Color(0xFFF5F5F5),
      child: offersCarrousel(controller),
    );
  }

  Widget offersCarrousel(Controller controller) {
    var textOferta = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.0,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '¡Tenemos ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFF313235),
            ),
          ),
          TextSpan(
            text: 'ofertas exclusivas',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF313235),
            ),
          ),
          TextSpan(
            text: ' para mejorar tu experiencia Movistar!',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFF313235),
            ),
          ),
        ],
      ),
    );
    return Container(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width - 70.0,
                  child: textOferta,
                ),
                GestureDetector(
                  onTap: () async {
                    await controller
                        .changeStateCarrousel(controller.carrouselState.value);
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    child: Obx(() {
                      if (controller.carrouselState.value ==
                          CarrouselState.expanded) {
                        return SvgPicture.asset(
                          'assets/icon_arrow_carrousel2.svg',
                          alignment: Alignment.center,
                          color: Color(0xFF019DF4),
                        );
                      } else {
                        return SvgPicture.asset(
                          'assets/icon_arrow_carrousel.svg',
                          alignment: Alignment.center,
                          color: Color(0xFF019DF4),
                        );
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Obx(() {
              print("Obx " + controller.carrouselState.value.toString());
              if (controller.carrouselState.value == CarrouselState.expanded) {
                return Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: 280.0,
                      margin: EdgeInsets.only(
                        top: 20.0,
                      ),
                      color: Color(0xFFF5F5F5),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          carrouselItemWidget(),
                          carrouselItemWidget(),
                          carrouselItemWidget(),
                        ],
                      ),
                    ),
                    // Steps
                    Container(
                      width: Get.width,
                      height: 20.0,
                      margin: EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 42.0,
                            height: 6.0,
                            margin: EdgeInsets.only(left: 8.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF019DF4),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          Container(
                            width: 18.0,
                            height: 6.0,
                            margin: EdgeInsets.only(left: 8.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF019DF4).withOpacity(.6),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          Container(
                            width: 18.0,
                            height: 6.0,
                            margin: EdgeInsets.only(left: 8.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF019DF4).withOpacity(.6),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox.shrink();
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget carrouselItemWidget() {
    return Container(
      width: 350.0,
      margin: EdgeInsets.only(
        left: 20.0,
        top: 10.0,
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage("assets/banner1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        height: 180,
        margin: EdgeInsets.only(
          top: 100.0,
        ),
        padding: EdgeInsets.only(
          top: 20.0,
        ),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color(0xFF565D5C),
              Color(0xFFB9BBBC),
            ],
            radius: 2,
            stops: [0.2, 1],
            center: Alignment(.0, -.9),
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(
              Get.width,
              Get.height * .07,
            ),
          ),
        ),
        child: contentItemCardCarrousel(),
      ),
    );
  }

  Widget contentItemCardCarrousel() {
    var textCarrousel = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.0,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '¡Renueva tu equipo y recíbelo ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: 'en casa! Huawei Y9 Prime',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Row(
            children: [
              Container(
                width: Get.width * .2,
                height: 30.0,
                decoration: BoxDecoration(
                  color: Color(0xFF0B2739),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Pie \$0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF019DF4),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "18 cuotas de \$9.990 con t.crédito",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 5.0,
          ),
          child: textCarrousel,
        ),
        Container(
          width: Get.width * .6,
          height: 40.0,
          margin: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 5.0,
            bottom: 5.0,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFD4487F),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  "Por sólo  ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  "  \$",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "179.982",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget contentWidget() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Banner superior:         height 300.0
          Container(
            width: Get.width,
            height: Get.height * .25 + 50,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * .22,
                  decoration: BoxDecoration(
                    color: Color(0xFF019DF4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: personalInformationWidget(),
                ),
                Positioned(
                  bottom: 5,
                  child: Container(
                    width: Get.width,
                    height: 130.0,
                    color: Colors.transparent,
                    padding: EdgeInsets.only(left: 20.0),
                    child: cardsWidget(),
                  ),
                ),
              ],
            ),
          ),
          // Banner carrousel bolsas: height 250.0
          Container(
            width: Get.width,
            height: 250.0,
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  "Tus bolsas",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Color(0xFF313235),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                generateListBolsa(),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 12,
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Color(0xFF019DF4),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Container(
                        width: 15,
                        height: 12,
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Color(0xFFD3D4D3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Cards Offers:            height 220.0
          Container(
            width: Get.width,
            height: 200.0,
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color(0xFF922859),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            width: Get.width,
            height: 200.0,
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color(0xFF0178E6),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget personalInformationWidget() {
    return Container(
      height: Get.height * .1,
      margin: EdgeInsets.only(bottom: 70.0),
      padding: EdgeInsets.only(
        top: Get.height * .01,
        left: Get.width * .03,
        right: Get.width * .03,
      ),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            child: SvgPicture.asset(
              'assets/icon_avatar.svg',
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: Get.width * .02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "¡Hola María Francisca!",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * .005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estás en el número",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        width: Get.width * .3,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF0C273A),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Center(
                          child: Text(
                            "998765432",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
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
    );
  }

  Widget cardsWidget() {
    return Container(
      color: Colors.transparent,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          cardItemWidget(),
          cardItemWidget(),
          cardItemWidget(),
        ],
      ),
    );
  }

  Widget cardItemWidget() {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: Get.width * .8,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20.0),
                width: 50.0,
                height: 70.0,
                child: Icon(
                  Icons.phone_android_rounded,
                  color: Color(0xFF019DF4),
                  size: 50.0,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 130,
                            height: 25,
                            child: Text(
                              "Tu saldo es de",
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 45,
                            child: Text(
                              "\$12.590",
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 20,
                            child: Text(
                              "Vence 03/11/20",
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 100.0,
                          margin: EdgeInsets.only(bottom: 20.0),
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF019DF4),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "Recargar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget generateListBolsa() {
    return Container(
      width: Get.width,
      height: 200.0,
      padding: EdgeInsets.all(5),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          cardBolsas(),
          cardBolsas(),
          cardBolsas(),
        ],
      ),
    );
  }

  Widget cardBolsas() {
    return Container(
      width: 300.0,
      margin: EdgeInsets.only(left: 20.0),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(),
      ),
    );
  }
}

enum CarrouselState {
  expanded,
  collapsed,
}

class Controller extends GetxController {
  var carrouselState = CarrouselState.collapsed.obs;

  changeStateCarrousel(CarrouselState state) {
    print("changeEvent: " + state.toString());
    if (state == CarrouselState.collapsed) {
      carrouselState(CarrouselState.expanded);
    } else {
      carrouselState(CarrouselState.collapsed);
    }
  }
}
