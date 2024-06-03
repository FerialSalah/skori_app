import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/button/button_app.dart';
import 'package:skori/core/widgets/main_text.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../teams/presentation/screens/team_profile.dart';
import '../screens/match_profile.dart';

class MatchAppBar extends StatelessWidget {
  final int homeTeamId;
  final int awayTeamId;
  final String title;
  final String homeTeamLogo;
  final String homeTeamName;
  final String homeTeamScore;
  final String time;
  final String date;
  final String logo;
  final String currentTime;
  final String awayTeamScore;
  final String stadium;
  final String awayTeamLogo;
  final String awayTeamName;
  final String watchLink;
  final String type;
  const MatchAppBar(
      {Key? key,
      required this.title,
      required this.homeTeamLogo,
      required this.homeTeamName,
      required this.homeTeamScore,
      required this.time,
      required this.date,
      required this.logo,
      required this.currentTime,
      required this.awayTeamScore,
      required this.stadium,
      required this.awayTeamLogo,
      required this.awayTeamName,
      required this.watchLink,
      required this.type,
      required this.homeTeamId,
      required this.awayTeamId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 275.h,
      pinned: true,
      backgroundColor: ColorApp.primary,
      leadingWidth: 60,
      toolbarHeight: 60,
      elevation: 0,
      leading: GestureDetector(
          onTap: () {
            RouteManager.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorApp.white,
          )),
      title: MainText(
        text:  LocaleKeys.matchDetails.tr(),
        color: ColorApp.white,
        font: 14,
        family: TextFontApp.boldFont,
      ),
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.5,
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70.h,
            ),
            Container(
              // height: 160.h,
              margin: EdgeInsets.only(top: 15),
              //  decoration: BoxDecoration(
              //    border: Border.all(color: ColorApp.borderGray, width: .5),
              //  ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
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
                                  color: ColorApp.white,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 10.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainText(
                              text: time,
                              font: 16,
                              family: TextFontApp.boldFont,
                              color: ColorApp.white,
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
                                  color: ColorApp.white,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (stadium.isNotEmpty)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            color: ColorApp.white,
                          )
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          title: type == "recorded"
                              ? LocaleKeys.watchNow.tr()
                              : type == "live"
                                  ? LocaleKeys.watchLive.tr()
                                  : LocaleKeys.watchNow.tr(),
                          textColor: type == "live" && watchLink.isNotEmpty
                              ? ColorApp.white
                              : type == "recorded" && watchLink.isNotEmpty
                                  ? ColorApp.white
                                  : ColorApp.hintGray,
                          color: type == "live" && watchLink.isNotEmpty
                              ? ColorApp.red
                              : type == "recorded" && watchLink.isNotEmpty
                                  ? ColorApp.red
                                  : ColorApp.borderGray,
                          width: 136.w,
                          height: 36.h,
                          onPressed: () {
                            // print(watchLink);
                            if (type == "live" && watchLink.isNotEmpty) {
                              String url = watchLink
                                  .toString()
                                  .substring(0)
                                  .replaceAll('/watch?v=', '/embed/');
                              print(url);

                              watchLink.toString().contains('mp4')
                                  ? RouteManager.navigateTo(VideoMatchPageMp4(
                                      videoUrl: watchLink,
                                    ))
                                  : RouteManager.navigateTo(VideoMatchPage(
                                      youtubeUrl: watchLink,
                                    ));
                            } else if (type == "recorded" &&
                                watchLink.isNotEmpty) {
                              watchLink.toString().contains('mp4')
                                  ? RouteManager.navigateTo(VideoMatchPageMp4(
                                      videoUrl: watchLink,
                                    ))
                                  : RouteManager.navigateTo(VideoMatchPage(
                                      youtubeUrl: watchLink,
                                    ));
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
