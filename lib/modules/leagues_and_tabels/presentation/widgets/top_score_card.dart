import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_discipline_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_top_entity.dart';
import 'package:skori/modules/players/presentation/screens/player_profile.dart';

import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../teams/presentation/screens/team_profile.dart';

class TopScoreCard extends StatelessWidget {
  final LeagueTopEntity leagueTopEntity;
  final int index;
  const TopScoreCard(
      {super.key, required this.leagueTopEntity, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: index % 2 == 0 ? ColorApp.white : ColorApp.background,
        border: Border.all(
          color: index % 2 == 0 ? ColorApp.borderGray : ColorApp.background,
          // width: 1,
        ),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 25,
                height: 25,
                color:index<=4? ColorApp.yellow:ColorApp.backgroundGray,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: MainText(
                  text: (index + 1).toString(),
                  font: 12,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  family: TextFontApp.semiBoldFont,
                  color: index<=4? ColorApp.white:ColorApp.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  RouteManager.navigateTo(PlayerProfile(
                    id: leagueTopEntity.player!.id!,
                    name: leagueTopEntity.player!.name!,
                    avatar: leagueTopEntity.player!.avatar!,
                    clubLogo: leagueTopEntity.team!.logo!,
                    clubName: leagueTopEntity.team!.name!,
                    isFav: false,
                    isFollow: false,
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      leagueTopEntity.player!.avatar!,
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 80.w,
                      child: MainText(
                        text: leagueTopEntity.player!.name,
                        font: 12,
                        family: TextFontApp.semiBoldFont,
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  RouteManager.navigateTo(TeamProfile(
                    id: leagueTopEntity.team!.id!,
                    name: leagueTopEntity.team!.name!,
                    logo: leagueTopEntity.team!.logo!,
                    countryFlag: "",
                    countryName: "",
                    season: " ",
                    isFollowing: false,
                    isFav: false,
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      leagueTopEntity.team!.logo!,
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 80.w,
                      child: MainText(
                        text: leagueTopEntity.team!.name,
                        font: 12,
                        family: TextFontApp.semiBoldFont,
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        SizedBox(
         width:context.locale.languageCode=="ar"?  10.w:23.w
        ),
          Row(
            children: [
              SizedBox(
                width:context.locale.languageCode=="ar"? 4.w:0.w,
              ),
              MainText(
                text: leagueTopEntity.totalMatches,
                font: 12,
                family: TextFontApp.boldFont,
              ),
              SizedBox(
                width:context.locale.languageCode=="ar"? 38.w:35.w,
              ),
              SizedBox(
                //width: 30.w,
                child: MainText(
                  text:leagueTopEntity.totalGoals!=null? leagueTopEntity.totalGoals:leagueTopEntity.totalAssists,
                  font: 14,
                  family: TextFontApp.mediumFont,
                ),
              ),
              // SizedBox(
              //   width: 20.w,
              // ),

            ],
          )
        ],
      ),
    );
  }
}
