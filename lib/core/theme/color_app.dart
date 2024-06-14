import 'package:flutter/material.dart';

class ColorApp {
  // PRIMARY COLORS
  static final Color primary = HexColor.fromHex('#19204E');



  // STATE COLORS
  // static final Color successColor = HexColor.fromHex('#6EBF97');
  static final Color error = HexColor.fromHex('#E01942');


  ///// GREY COLOR
  static final Color hintGray = HexColor.fromHex('#929292');
  static final Color lightGray = hintGray.withOpacity(.05);
  static final Color backgroundGray = hintGray.withOpacity(.03);
  static final Color borderGray = hintGray.withOpacity(.2);
  static final Color background = HexColor.fromHex('#FBFBFB');





  //// OTHER
  static final Color black = HexColor.fromHex('#000000');
  static final Color white = HexColor.fromHex('#FFFFFF');
  static final Color red = HexColor.fromHex('#E01942');
  static final Color yellow = HexColor.fromHex('#FDB302');
  static final Color lightYellow = HexColor.fromHex('#FDB3020F');
  static final Color blue = HexColor.fromHex('#1D9BF0');
  static final Color face = HexColor.fromHex('#2B5EB7');
  static final Color green = HexColor.fromHex('#1DBE69');
  static final Color darkBlue = HexColor.fromHex('#19204E');
  static final Color darkGray=HexColor.fromHex('#F7F7F7');









}

//Extension for converting hex color string to color
extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    //Adding FF to the beginning of the string
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
