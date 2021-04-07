import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavMovistar extends StatefulWidget {
  final String textoHome;

  const BottomNavMovistar({Key key, this.textoHome}) : super(key: key);

  @override
  _BottomNavMovistarState createState() => _BottomNavMovistarState();
}

class _BottomNavMovistarState extends State<BottomNavMovistar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * .1,
      color: Color(0xFF019DF4),
      child: Row(
        children: [
          Container(
            width: Get.width * .20,
            decoration: BoxDecoration(
              color: Color(0xFF0B2739),
              border: Border(
                right: BorderSide(color: Colors.white, width: 1),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icon_resume.svg',
                  alignment: Alignment.center,
                  width: 20,
                  height: 30,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    widget.textoHome,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width * .20,
            decoration: BoxDecoration(
              color: Color(0xFF019DF4),
              border: Border(
                right: BorderSide(color: Colors.white, width: 1),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icon_offers.svg',
                  alignment: Alignment.center,
                  width: 25,
                  height: 30,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "Ofertas",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width * .20,
            margin: EdgeInsets.only(top: Get.height * .026),
            decoration: BoxDecoration(
              color: Color(0xFF019DF4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Recargar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width * .20,
            decoration: BoxDecoration(
              color: Color(0xFF019DF4),
              border: Border(
                left: BorderSide(color: Colors.white, width: 1),
                right: BorderSide(color: Colors.white, width: 1),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icon_help.svg',
                  alignment: Alignment.center,
                  width: 20,
                  height: 30,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "Ayuda",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width * .20,
            decoration: BoxDecoration(
              color: Color(0xFF019DF4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                SvgPicture.asset(
                  'assets/icon_points.svg',
                  alignment: Alignment.center,
                  width: 8,
                  height: 8,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Más",
                    style: TextStyle(color: Colors.white),
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
