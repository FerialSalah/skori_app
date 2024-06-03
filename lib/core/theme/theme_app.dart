import 'package:flutter/material.dart';

import '../page_dimensions/app_padding.dart';
import '../page_dimensions/app_size.dart';
import 'color_app.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //Main app colors
    primaryColor: ColorApp.primary, //Error color for app
    disabledColor: ColorApp.hintGray, //Disabled color for widgets
    fontFamily: "Cairo",
    splashColor: ColorApp.primary, //Background color for widgets
    scaffoldBackgroundColor: ColorApp.background,
    canvasColor: Colors.transparent,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorApp.primary,
    ),
    // canvasColor: Colors.transparent,
    //    colorScheme:
    //     Theme.of(context).colorScheme.copyWith(primary: ColorApp.primary),
    // iconTheme: Theme.of(context).iconTheme.copyWith(size: 12.0),
    // fontFamily: 'Metropolis', //Font family for app

    appBarTheme: AppBarTheme(
      centerTitle: true,
    //Center appbar title
      color: ColorApp.white, //Appbar color
    ),
    iconTheme: IconThemeData(
      color: ColorApp.primary, //Icon color
    ),

    //Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(), //Button shape
      buttonColor: ColorApp.primary, //Button color
      splashColor: ColorApp.primary, //Button splash color
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle:
          TextStyle(color: ColorApp.hintGray), //Label style for input fields
      floatingLabelStyle: TextStyle(
          color: ColorApp.primary), //Floating label style for input fields
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.buttonRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.buttonRadius),
        borderSide: BorderSide(color: ColorApp.primary),
      ),
      contentPadding: const EdgeInsets.all(
          AppPadding.contentPadding), //Content padding for input fields
    ), colorScheme: ThemeData().colorScheme.copyWith(
          primary: ColorApp.primary,
        ).copyWith(surface: ColorApp.white).copyWith(error: ColorApp.error),

    //Text theme
    // textTheme: TextTheme(
    //   headline1: , //Headline 1 text style
    //   headline2: , //Headline 2 text style
    //   headline3: , //Headline 3 text style
    //   headline4: , //Headline 4 text style
    //   headline5: , //Headline 5 text style
    //   subtitle1: , //Subtitle 1 text style
    //   subtitle2: , //Subtitle 2 text style
    //   bodyText1: , //Body text 1 text style
    //   bodyText2: , //Body text 2 text style
    // ),
  );
}
