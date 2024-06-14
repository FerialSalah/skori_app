import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/constant/app_assets.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/players/presentation/screens/player_profile.dart';
import 'package:skori/modules/teams/presentation/screens/team_profile.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/images/cached_network_image.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../domain/entity/transfer_entity.dart';

class TransferCard extends StatelessWidget {
  final int playerId;
  final int teamMovedFromId;
  final int teamMovedToId;
  final String playerName;
  final String playerImage;
  final String playerMovedDate;
  final String fee;
  final String playerTeamMovedFromImage;
  final String playerTeamMovedFromName;
  final String playerTeamMovedToImage;
  final String playerTeamMovedToName;
  final String countryName;
  final String countryFlag;

  const TransferCard({
    super.key,
    required this.playerName,
    required this.playerImage,
    required this.playerMovedDate,
    required this.fee,
    required this.playerTeamMovedFromImage,
    required this.playerTeamMovedFromName,
    required this.playerTeamMovedToImage,
    required this.playerTeamMovedToName,
    required this.playerId,
    required this.teamMovedFromId,
    required this.teamMovedToId,
    required this.countryName,
    required this.countryFlag,
  });

  @override
  Widget build(BuildContext context) {
     print("playerTeamMovedFromName:   ${playerTeamMovedFromName.isNotEmpty}");
    // print("playerTeamMovedToImage:   $playerTeamMovedToImage");

    return Container(
      height: 180.h,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: ColorApp.white,
        // border: Border.all(color: ColorApp.borderGray, width: .5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 80.h,
                width: 80.w,
                // color: Colors.red,
                child: CachedImageNetwork(
                  image: playerImage,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              GestureDetector(
                onTap: () {
                  RouteManager.navigateTo(PlayerProfile(
                      id: playerId,
                      name: playerName,
                      avatar: playerImage,
                      clubLogo: playerTeamMovedToImage,
                      clubName: playerTeamMovedToName,
                      isFollow: false,
                      isFav: false));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: SizedBox(
                        width: 200.w,
                        child: MainText(
                          text: playerName,
                          font: 14,
                          family: TextFontApp.boldFont,
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      SizedBox(
                        width: 120.w,
                        height: 30.h,
                        child: MainText(
                            text: LocaleKeys.date.tr() + " " + playerMovedDate,
                            font: 12,
                            family: TextFontApp.mediumFont,
                            color: ColorApp.hintGray),
                      ),
                      SizedBox(
                      //  width: 125.w,
                        height: 30.h,
                        child: MainText(
                          text: fee.isNotEmpty
                              ? LocaleKeys.fee.tr() + " " + fee
                              : LocaleKeys.fee.tr() +
                                  " " +
                                  LocaleKeys.undisclosed.tr(),
                          font: 12,
                          color: ColorApp.hintGray,
                          family: TextFontApp.mediumFont,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          center: true,
                        ),
                      )
                    ])
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
            child: Divider(
              color: ColorApp.borderGray,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
       if(playerTeamMovedFromName!="")           RouteManager.navigateTo(TeamProfile(
                      id: teamMovedFromId,
                      name: playerTeamMovedFromName,
                      logo: playerTeamMovedFromImage,
                      countryFlag: countryFlag,
                      countryName: countryName,
                      isFollowing: false,
                      isFav: false,
                      season: ""));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: playerTeamMovedFromName!=""?
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                        height: 30.h,
                        child: CachedImageNetwork(
                          image: playerTeamMovedFromImage,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 100.w,
                        child: MainText(
                          text: playerTeamMovedFromName,
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          font: 13,
                          family: TextFontApp.boldFont,
                          center: true,
                        ),
                      ),
                    ],
                  ):SizedBox(
                    width: 100.w,
                    child: MainText(
                      text: LocaleKeys.unknown.tr(),
                      font: 13,
                      family: TextFontApp.semiBoldFont,
                      center: true,

                    ),
                  ),
                ),
              ),
              Image.asset(
                context.locale.languageCode == "ar"
                    ? AppIcons.leftTransfer
                    : AppIcons.transfer,
                width: 15.w,
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
          if(playerTeamMovedToName!="")        RouteManager.navigateTo(TeamProfile(
                      id: teamMovedToId,
                      name: playerTeamMovedToName,
                      logo: playerTeamMovedToImage,
                      countryFlag: countryFlag,
                      countryName: countryName,
                      isFollowing: false,
                      isFav: false,
                      season: ""));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: playerTeamMovedToName!=""?
                  Row(
                    children: [
                      SizedBox(
                        width: 15.w,
                        height: 25.h,
                        child: CachedImageNetwork(
                          image: playerTeamMovedToImage,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 100,
                        child: MainText(
                          text: playerTeamMovedToName,
                          font: 13,
                          family: TextFontApp.boldFont,
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          center: true,
                        ),
                      ),
                    ],
                  ):SizedBox(
                    width: 100.w,
                    child: MainText(
                      text: LocaleKeys.unknown.tr(),
                      font: 16,
                      family: TextFontApp.semiBoldFont,
                      center: true,

                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
