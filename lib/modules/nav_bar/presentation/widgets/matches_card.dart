import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/widgets/button/border_button.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/modules/matches/presentation/bloc/match_statistics_bloc.dart';
import 'package:skori/modules/teams/presentation/screens/team_profile.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../authentication/presentation/screens/login_screen.dart';
import '../../../matches/presentation/bloc/match_statistics_event.dart';
import '../../../matches/presentation/screens/match_profile.dart';
import '../../../matches/presentation/screens/statistics_screen.dart';

class MatchesCard extends StatelessWidget {
  final int id;
  final String title;
  final String type;
  final String watchLink;
  final String homeTeamName;
  final String homeTeamScore;
  final String homeTeamLogo;
  final String awayTeamName;
  final String awayTeamScore;
  final String stadium;
  final String awayTeamLogo;
  final String logo;
  final String time;
  final String date;
  final String currentTime;
  final int homeTeamId;
  final int awayTeamId;
  final bool isMatchScreen;

  const MatchesCard(
      {Key? key,
      required this.homeTeamName,
      required this.homeTeamScore,
      required this.homeTeamLogo,
      required this.awayTeamName,
      required this.awayTeamScore,
        required this.stadium,
      required this.awayTeamLogo,
      required this.logo,
      required this.time,
      required this.date,
      required this.currentTime,
      required this.title,
      required this.type,
      required this.watchLink,
      required this.id,
      required this.homeTeamId,
      required this.awayTeamId,
      required this.isMatchScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isMatchScreen) {
          print(!isMatchScreen);
          if (AppStorage.isLogged) {
            RouteManager.navigateTo(StatisticsScreen(
              id: id,
              title: title,
              type: type,
              watchLink: watchLink,
              homeTeamName: homeTeamName,
              homeTeamScore: homeTeamScore,
              homeTeamLogo: homeTeamLogo,
              awayTeamName: awayTeamName,
              awayTeamScore: awayTeamScore,
              stadium: stadium,
              awayTeamLogo: awayTeamLogo,
              logo: logo,
              time: time,
              date: date,
              currentTime: currentTime,
              homeTeamId: homeTeamId,
              awayTeamId: awayTeamId,
            ));
          } else {
            RouteManager.navigateTo(LoginScreen());
          }
        }
      },
      child: Container(
        //height: 200.h,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(color: ColorApp.borderGray, width: .5),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (isMatchScreen)
                      RouteManager.navigateTo(TeamProfile(
                        id: homeTeamId,
                        name: homeTeamName,
                        logo: homeTeamLogo,
                        season: title,
                        isFollowing: false,
                        countryFlag: "",
                        countryName: "",
                        isFav: false,
                      ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        homeTeamLogo,
                        height: 40.h,
                        width: 24.w,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          width: 70.w,
                          child: MainText(
                            text: homeTeamName,
                            font: 14,
                            family: TextFontApp.regularFont,
                            center: true,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                MainText(
                  text: homeTeamScore,
                  font: 25,
                  family: TextFontApp.boldFont,
                  color: ColorApp.yellow,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainText(
                        text: time,
                        font: 16,
                        family: TextFontApp.boldFont,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: MainText(
                          text: date,
                          font: 12,
                          family: TextFontApp.mediumFont,
                          color: ColorApp.hintGray,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Image.network(
                          logo,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      Container(
                        height: 24.h,
                        width: 48.w,
                        color: ColorApp.red,
                        child: Center(
                            child: MainText(
                          text: currentTime,
                          font: 10,
                          family: TextFontApp.regularFont,
                          color: ColorApp.white,
                        )),
                      ),
                    ],
                  ),
                ),
                MainText(
                  text: awayTeamScore,
                  font: 25,
                  family: TextFontApp.boldFont,
                  color: ColorApp.yellow,
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    if (isMatchScreen)
                      RouteManager.navigateTo(TeamProfile(
                        id: awayTeamId,
                        name: awayTeamName,
                        logo: awayTeamLogo,
                        season: title,
                        isFollowing: false,
                        countryFlag: "",
                        countryName: "",
                        isFav: false,
                      ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        awayTeamLogo,
                        height: 40.h,
                        width: 24.w,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          width: 70.w,
                          child: MainText(
                            text: awayTeamName,
                            font: 14,
                            family: TextFontApp.regularFont,
                            center: true,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            isMatchScreen
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
                    child: Divider(),
                  )
                : Container(),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Image.network(
            //         homeTeamLogo,
            //         height: 40.h,
            //         width: 24.w,
            //       ),
            //       SizedBox(
            //         width: 10.h,
            //       ),
            //       MainText(
            //         text: homeTeamName,
            //         font: 14,
            //         family: TextFontApp.regularFont,
            //         center: true,
            //       )
            //     ],
            //   ),
            // ),
           if(isMatchScreen)
             if (stadium.isNotEmpty)
               Padding(
                 padding:
                 EdgeInsets.symmetric(horizontal: 30.w,),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Image.asset(
                       AppIcons.location,
                       height: 40.h,
                       width: 24.w,
                     ),
                     SizedBox(
                       width: 10.h,
                     ),
                     MainText(
                       text: stadium,
                       font: 14,
                       family: TextFontApp.mediumFont,
                       center: true,
                       color: ColorApp.red,
                     )
                   ],
                 ),
               ),

            if (isMatchScreen)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    type == "scheduled"
                        ? Container()
                        : AppButton(
                            title: type == "recorded"
                                ? LocaleKeys.watchNow.tr()
                                : type == "live"
                                    ? LocaleKeys.watchLive.tr()
                                    : LocaleKeys.watchNow.tr(),
                            textColor: type == "live" && watchLink.isNotEmpty
                                ? ColorApp.white: type=="recorded"&& watchLink.isNotEmpty?
                                ColorApp.white
                                : ColorApp.hintGray,
                            color: type == "live" && watchLink.isNotEmpty
                                ? ColorApp.red: type=="recorded"&&watchLink.isNotEmpty?
                                ColorApp.red
                                : ColorApp.borderGray,
                            width: 136.w,
                            height: 40.h,
                            onPressed: () {
                              print("match type is: $type");
                              print("match link is :$watchLink");
                              if (!AppStorage.isLogged) {
                                RouteManager.navigateTo(LoginScreen());
                              } else if (type == "live" &&
                                  watchLink.isNotEmpty) {
                                watchLink.toString().contains('mp4')?
                                RouteManager.navigateTo(VideoMatchPageMp4(
                                  videoUrl: watchLink,

                                )):     RouteManager.navigateTo(VideoMatchPage(
                                  youtubeUrl: watchLink,
                                ));
                              } else if (type == "recorded" &&
                                  watchLink.isNotEmpty) {
                                watchLink.toString().contains('mp4')?
                                RouteManager.navigateTo(VideoMatchPageMp4(
                                  videoUrl: watchLink,
                                )):     RouteManager.navigateTo(VideoMatchPage(
                                  youtubeUrl: watchLink,
                                ));

                              }
                            },
                          ),
                    BorderButton(
                      hor: 10.w,
                      title: LocaleKeys.statistics.tr(),
                      color: ColorApp.white,
                      borderColor: ColorApp.red,
                      width: type == "scheduled" ? 283.w : 136.w,
                      height: 40.h,
                      textColor: ColorApp.red,
                      onPressed: () async {
                        if (AppStorage.isLogged) {
                          RouteManager.navigateTo(StatisticsScreen(
                            type: type,
                            watchLink: watchLink,
                            homeTeamId: homeTeamId,
                            awayTeamId: awayTeamId,
                            title: title,
                            homeTeamLogo: homeTeamLogo,
                            homeTeamName: homeTeamName,
                            homeTeamScore: homeTeamScore,
                            stadium: stadium,
                            time: time,
                            date: date,
                            logo: logo,
                            currentTime: currentTime,
                            awayTeamScore: awayTeamScore,
                            awayTeamLogo: awayTeamLogo,
                            awayTeamName: awayTeamName,
                            id: id,
                          ));
                        } else {
                          RouteManager.navigateTo(LoginScreen());
                        }
                      },
                    )
                  ],
                ),
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
