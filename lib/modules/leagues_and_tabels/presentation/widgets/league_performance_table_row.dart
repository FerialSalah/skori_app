import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../teams/presentation/screens/team_profile.dart';

TableRow leaguePerformanceTableRow({
  required String date,
  required int homeTeamId,
  required int awayTeamId,
  required String homeTeamLogo,
  required String awayTeamLogo,
  required String homeTeamName,
  required String awayTeamName,
  required String homeTeamScore,
  required String awayTeamScore,
  required int totalScores,
}) {
  return TableRow(
    decoration: BoxDecoration(color: ColorApp.white),
    children: [
      Container(
        height: 55.h,
        child: Center(
            child: SizedBox(
          width: 80,
          child: MainText(
            text: "$date",
            font: 12,
            overflow: TextOverflow.clip,
            maxLines: 2,
            family: TextFontApp.semiBoldFont,
          ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              homeTeamLogo,
              height: 24,
              width: 24,
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 80,
              child: MainText(
                text: "$homeTeamName",
                font: 12,
                family: TextFontApp.semiBoldFont,
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
      Center(
        child: MainText(
          text: "$homeTeamScore",
          font: 12,
          family: TextFontApp.mediumFont,
          color: ColorApp.yellow,
        ),
      ),
      SizedBox(
        width: 5,
      ),
      Center(
          child: MainText(
        text: "-",
        font: 12,
        family: TextFontApp.mediumFont,
            color: ColorApp.yellow,
      )),
      SizedBox(
        width: 5,
      ),
      Center(
          child: MainText(
        text: "$awayTeamScore",
        font: 12,
        family: TextFontApp.mediumFont,
        color: ColorApp.yellow,
      )),

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
        child: Row(
          children: [
            Image.network(
              awayTeamLogo,
              height: 24,
              width: 24,
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 80,
              child: MainText(
                text: "$awayTeamName",
                font: 12,
                family: TextFontApp.semiBoldFont,
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 80,
        child: MainText(
          text: "$totalScores",
          font: 12,
          family: TextFontApp.semiBoldFont,
          color: ColorApp.yellow,
        ),
      )
    ],
  );
}
