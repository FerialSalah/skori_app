import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_discipline_entity.dart';

import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../teams/presentation/screens/team_profile.dart';

class LeagueDisciplineCard extends StatelessWidget {
  final LeagueDisciplineEntity leagueDisciplineEntity;
  final int index;
  const LeagueDisciplineCard(
      {super.key, required this.leagueDisciplineEntity, required this.index});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: MainText(
                  text: (index + 1).toString(),
                  font: 12,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  family: TextFontApp.semiBoldFont,
                ),
              ),
              GestureDetector(
                onTap: () {
                  RouteManager.navigateTo(TeamProfile(
                    id: leagueDisciplineEntity.team!.id,
                    name: leagueDisciplineEntity.team!.name,
                    logo: leagueDisciplineEntity.team!.logo,
                    countryFlag: "",
                    countryName: "",
                    season: " ",
                    isFollowing: false,
                    isFav: false,
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      leagueDisciplineEntity.team!.logo,
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 65.w,
                      child: MainText(
                        text: leagueDisciplineEntity.team!.name,
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

          // SizedBox(
          //   width: 5.w,
          // ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
                child: MainText(
                  text: leagueDisciplineEntity.matchesNo,
                  font: 12,
                  family: TextFontApp.boldFont,
                 center: true,
                ),
              ),
              SizedBox(
                width: 25.w,
              ),

              SizedBox(
                width: 20,
                child: MainText(
                  text: leagueDisciplineEntity.yellowCardsNo,
                  font: 12,
                  family: TextFontApp.mediumFont,
                  center: true,

                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              SizedBox(
                width: 20,
                child: MainText(
                  text: leagueDisciplineEntity.yellowCardsNo,
                  font: 12,
                  family: TextFontApp.semiBoldFont,
                  center: true,
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              SizedBox(
                width: 20.w,
                child: MainText(
                  text: leagueDisciplineEntity.pointsNo,
                  font: 12,
                  family: TextFontApp.semiBoldFont,
                  center: true,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
