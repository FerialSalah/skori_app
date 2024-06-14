import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../teams/presentation/screens/team_profile.dart';

TableRow leagueDisciplineTableRow({
  required String logo,
  required String name,
  required int id,
  // required bool isFollowing,
  // required bool isFav,
  required int index,
  required String yellowCardsNum,
  required String redCardsNum,
  required String pts,
  required String matchesNum,
}) {
  return TableRow(
    decoration: BoxDecoration(color: ColorApp.white),
    children: [
      Container(
        height: 55.h,
        child: Center(
            child: MainText(
          text: "$index",
          font: 12,
          family: TextFontApp.semiBoldFont,
        )),
      ),
      GestureDetector(
        onTap: () {
          // RouteManager.navigateTo(TeamProfile(
          //   id: id,
          //   name: name,
          //   logo: logo,
          //   countryFlag: countryFlag,
          //   countryName: countryName,
          //   season: " ",
          //   isFollowing: isFollowing,
          //   isFav: isFav,
          // ));
        },
        child: Center(
          child: Row(
            children: [
              Image.network(
                logo,
                height: 24,
                width: 24,
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 90,
                      child: MainText(
                        text:name.isNotEmpty? name:"",
                        font: 12,
                        family: TextFontApp.semiBoldFont,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      )),
                  // SizedBox(height: 5,),
                  // MainText(text: "Qualified: Promotion",font: 9,family: TextFontApp.regularFont,
                  //   color: ColorApp.green,),
                ],
              ),
            ],
          ),
        ),
      ),
      Center(
          child: MainText(
        text:matchesNum.isNotEmpty? "$matchesNum":"",
        font: 12,
        family: TextFontApp.mediumFont,
      )),
      Center(
          child: MainText(
        text:yellowCardsNum.isNotEmpty? "$yellowCardsNum":"",
        font: 12,
        family: TextFontApp.mediumFont,
      )),
      Center(
          child: MainText(
        text:redCardsNum.isNotEmpty? "$redCardsNum":"",
        font: 12,
        family: TextFontApp.mediumFont,
      )),
      Center(
          child: MainText(
        text: pts.isNotEmpty?"$pts":"",
        font: 12,
        family: TextFontApp.boldFont,
      )),
    ],
  );
}
