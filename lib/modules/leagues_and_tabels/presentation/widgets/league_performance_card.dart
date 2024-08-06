import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_performance_entity.dart';

import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../teams/presentation/screens/team_profile.dart';

class LeaguePerformanceCard extends StatelessWidget {
  final LeaguePerformanceEntity? leaguePerformanceEntity;
  final int index;
  const LeaguePerformanceCard(
      {super.key, required this.leaguePerformanceEntity, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      // width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: index % 2 == 0 ? ColorApp.white : ColorApp.background,
        border: Border.all(
          color:index % 2 == 0 ? ColorApp.borderGray:ColorApp.background,
          // width: 1,
        ),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            height: 55.h,
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            child: Center(
                child: SizedBox(
              width: 75.w,
              child: MainText(
                text: leaguePerformanceEntity!.date,
                font: 12,
                overflow: TextOverflow.clip,
                maxLines: 2,
                family: TextFontApp.semiBoldFont,
              ),
            )),
          ),
          SizedBox(
            width:context.locale.languageCode=="ar"? 5.w:15.w,
          ),
          GestureDetector(
            onTap: () {
              RouteManager.navigateTo(TeamProfile(
                id: leaguePerformanceEntity!.homeTeamId!,
                name: leaguePerformanceEntity!.homeTeamName!,
                logo: leaguePerformanceEntity!.homeTeamLogo!,
                countryFlag: "",
                countryName: "",
                season: leaguePerformanceEntity!.season,
                isFollowing: false,
                isFav: false,
              ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  leaguePerformanceEntity!.homeTeamLogo!,
                  height: 24,
                  width: 24,
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 60.w,
                  child: MainText(
                    text: leaguePerformanceEntity!.homeTeamName,
                    font: 12,
                    family: TextFontApp.semiBoldFont,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   width: 5.w,
          // ),
          SizedBox(
            width: 10.w,
            child: MainText(
              text: leaguePerformanceEntity!.homeTeamScore,
              font: 14,
              family: TextFontApp.mediumFont,
              color: ColorApp.yellow,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
            width: 5.w,
            child: MainText(

                        text: "-",
                        font: 14,
                        family: TextFontApp.mediumFont,
                        color: ColorApp.yellow,
                      ),
          ),
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
            width: 10.w,
            child: MainText(
              text: leaguePerformanceEntity!.awayTeamScore,
              font: 14,
              family: TextFontApp.mediumFont,
              color: ColorApp.yellow,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          GestureDetector(
            onTap: () {

              RouteManager.navigateTo(TeamProfile(
                id: leaguePerformanceEntity!.awayTeamId!,
                name: leaguePerformanceEntity!.awayTeamName!,
                logo: leaguePerformanceEntity!.awayTeamLogo!,
                countryFlag: "",
                countryName: "",
                season: leaguePerformanceEntity!.season,
                isFollowing: false,
                isFav: false,
              ));
            },
            child: Row(
              children: [
                Image.network(
                  leaguePerformanceEntity!.awayTeamLogo!,
                  height: 24,
                  width: 24,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  width: 60.w,
                 // color: Colors.cyan,
                  child: MainText(
                    text: leaguePerformanceEntity!.awayTeamName,
                    font: 12,
                    family: TextFontApp.semiBoldFont,
                    overflow: TextOverflow.clip,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width:25.w,
          ),
          SizedBox(
            //color: Colors.cyan,
            width: 20.w,
            child: MainText(
              text:
              leaguePerformanceEntity!.totalScores.toString(),
              font: 12,
              family: TextFontApp.semiBoldFont,
              color: ColorApp.yellow,
              center: true,
            ),
          )
        ],
      ),
    );
  }
}
