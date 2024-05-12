
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skori/generated/locale_keys.g.dart';
import '../constant/constants.dart';
import '../theme/color_app.dart';
import '../theme/textFont_app.dart';
import 'main_text.dart';


Widget emptyShow(){
  return Container(
    width: double.infinity,

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(getLottie("empty"),width:250,height: 250),
        MainText(text: LocaleKeys.emptyData.tr(),font: 16,color: ColorApp.black,family: TextFontApp.boldFont,),
      ],
    ),
  );
}