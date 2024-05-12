import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';

TableRow leagueTableHeader(){
  return    TableRow(
    decoration: BoxDecoration(
        color: ColorApp.red
    ),
    children: [
      Container(height:40,child: Text('')),
      Text(''),
      Center(child: MainText(text: "p",font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text: "W",font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text: "D",font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text: "L",font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text: "F:A",font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text: "+/-",font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),
      Center(child: MainText(text: "PTS",font: 12,family: TextFontApp.semiBoldFont,color: ColorApp.white,)),


    ],
  );
}