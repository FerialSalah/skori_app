import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../teams/presentation/screens/team_profile.dart';

TableRow leagueTableRow({required String logo,required String name,required int id,
  required String countryFlag,required String countryName,required bool isFollowing,required bool isFav,
  required int index,required int pts,required int win,required int lose,required int draw,required int scoreGoal,
  required int reverseGoal, required int differentGoal,required int matchesNum,}){
  return   TableRow(
    decoration: BoxDecoration(
        color: ColorApp.white
    ),

    children: [

      Container(
        height: 55.h,
        child:  Center(child: MainText(text: "$index",font: 12,family: TextFontApp.semiBoldFont,)),),
      GestureDetector(
        onTap: (){
          RouteManager.navigateTo(
              TeamProfile(
                id: id,
                name: name, logo: logo,
                countryFlag: countryFlag,
                countryName: countryName,
                season: " ",
                isFollowing: isFollowing,
                isFav: isFav,
              ));
        },
        child: Center(
          child: Row(
            children: [
              Image.network(logo,height: 24,width: 24,),
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width:90,
                      child: MainText(text: name,font: 12,family: TextFontApp.semiBoldFont,
                        maxLines: 2,
                        overflow: TextOverflow.clip,)),
                  // SizedBox(height: 5,),
                  // MainText(text: "Qualified: Promotion",font: 9,family: TextFontApp.regularFont,
                  //   color: ColorApp.green,),
                ],
              ),
            ],
          ),
        ),
      ),
      Center(child: MainText(text: "$matchesNum",font: 12,family: TextFontApp.mediumFont,)),
      Center(child: MainText(text: "$win",font: 12,family: TextFontApp.mediumFont,)),
      Center(child: MainText(text: "$draw",font: 12,family: TextFontApp.mediumFont,)),
      Center(child: MainText(text: "$lose",font: 12,family: TextFontApp.mediumFont,)),
      Center(child: MainText(text: "${scoreGoal}/${reverseGoal}",font: 12,family: TextFontApp.mediumFont,)),
      Center(child: MainText(text: "$differentGoal",font: 12,family: TextFontApp.mediumFont,)),
      Center(child: MainText(text: "$pts",font: 12,family: TextFontApp.boldFont,)),

    ],
  );
}

