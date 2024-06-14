import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:skori/generated/locale_keys.g.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';

TableRow leagueDisciplineTableHeader() {
  return TableRow(
    decoration: BoxDecoration(color: ColorApp.darkBlue),
    children: [
      Container(height: 40, child: Text('')),
      //Text(''),
      Center(
          child: MainText(
        text: "Rk",
        font: 12,
        family: TextFontApp.semiBoldFont,
        color: ColorApp.white,
      )),
      Center(
          child: MainText(
        text: LocaleKeys.team.tr(),
        font: 12,
        family: TextFontApp.semiBoldFont,
        color: ColorApp.white,
      )),
      Center(
          child: MainText(
        text: "p",
        font: 12,
        family: TextFontApp.semiBoldFont,
        color: ColorApp.white,
      )),
      Center(
          child: MainText(
        text: "YC",
        font: 12,
        family: TextFontApp.semiBoldFont,
        color: ColorApp.white,
      )),
      Center(
          child: MainText(
        text: "RC",
        font: 12,
        family: TextFontApp.semiBoldFont,
        color: ColorApp.white,
      )),
      Center(
          child: MainText(
        text: "PTS",
        font: 12,
        family: TextFontApp.semiBoldFont,
        color: ColorApp.white,
      )),
    ],
  );
}
