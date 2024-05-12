import 'dart:async';
import 'package:flutter/material.dart';
import '../routes/navigator_push.dart';
import '../theme/color_app.dart';
import '../theme/textFont_app.dart';


showSnackBar(String message,{bool popPage = false,duration = 3,bool secondaryColor = false}) {
  ScaffoldMessenger.of(RouteManager.currentContext).hideCurrentSnackBar();
  ScaffoldMessenger.of(RouteManager.currentContext).showSnackBar(
    SnackBar(
      backgroundColor:  ColorApp.primary ,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
      ),
      content: Text(message,style:
       TextStyle(color: ColorApp.white,
          fontFamily: TextFontApp.regularFont),),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
      duration: Duration(seconds: duration),
    ),
  );
  if(popPage)
    Timer(Duration(seconds: 5),()=> RouteManager.pop());
}