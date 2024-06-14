import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skori/generated/locale_keys.g.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';

TableRow leagueTableHeader(){
  return   TableRow(
    decoration: BoxDecoration(
        color: ColorApp.red
    ),
    children: [
      Container(height:40,child: Text(''),),
      Text(''),
      Center(child: MainText(text: LocaleKeys.P.tr(),font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text:LocaleKeys.w.tr() ,font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text:LocaleKeys.D.tr(),font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text: LocaleKeys.lose.tr(),font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text:LocaleKeys.fa.tr(),font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text: "+/-",font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text: LocaleKeys.pts.tr(),font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),


    ],
  );
}