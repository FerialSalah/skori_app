import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/loader.dart';
import 'package:skori/modules/matches/presentation/bloc/match_statistics_bloc.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../generated/locale_keys.g.dart';

class MatchStatisticCard extends StatefulWidget {
  final String homeTeamLogo;
  final String awayTeamLogo;

  const MatchStatisticCard(
      {Key? key, required this.homeTeamLogo, required this.awayTeamLogo})
      : super(key: key);

  @override
  State<MatchStatisticCard> createState() => _MatchStatisticCardState();
}

class _MatchStatisticCardState extends State<MatchStatisticCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchStatisticsBloc, BaseState>(
      builder: (context, state) {
        final matchStatistics =
            BlocProvider.of<MatchStatisticsBloc>(context).matchStatistics;

        if (state is LoadingState) {
          return ColorLoader();
        } else if (state is SuccessState) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainText(
                    text: LocaleKeys.SpecificStatistics.tr(),
                    font: 18,
                    family: TextFontApp.boldFont,
                    hor: 10.w,
                    ver: 10.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorApp.borderGray, width: 1),
                      color: ColorApp.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "matchStatistics.possession![index].value : ${matchStatistics.possession![index].value != null}");
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // MainText(
                                  //   text: matchStatistics.possession![index].name,
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        matchStatistics
                                                    .possession![index].value !=
                                                null
                                            ? matchStatistics.possession![index]
                                                        .value
                                                        .toString() !=
                                                    "premium"
                                                ? MainText(
                                                    text: matchStatistics
                                                            .possession![index]
                                                            .value
                                                            .homePossession ??
                                                        "" + "%",
                                                    family:
                                                        TextFontApp.boldFont,
                                                    font: 17,
                                                  )
                                                : Image.asset(
                                                    AppIcons.premium,
                                                    height: 24,
                                                    width: 24,
                                                  )
                                            : Image.asset(
                                                AppIcons.premium,
                                                height: 24,
                                                width: 24,
                                              ),
                                        new CircularPercentIndicator(
                                          radius: 80.0,
                                          lineWidth: 20.0,
                                          percent: matchStatistics
                                                      .possession![index]
                                                      .value !=
                                                  null
                                              ? matchStatistics
                                                          .possession![index]
                                                          .value
                                                          .toString() !=
                                                      "premium"
                                                  ? double.parse(matchStatistics
                                                          .possession![index]
                                                          .value
                                                          .awayPossession
                                                          .toString()) /
                                                      100
                                                  : 0.0
                                              : 0.0,
                                          header: MainText(
                                              text: matchStatistics
                                                  .possession![index].name,
                                              family: TextFontApp.boldFont,
                                              font: 15,
                                              ver: 10.h),
                                          center: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.network(
                                                widget.homeTeamLogo,
                                                height: 40.h,
                                                width: 24.w,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Container(
                                                width: 2.w,
                                                height: 50.h,
                                                color: ColorApp.borderGray,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Image.network(
                                                widget.awayTeamLogo,
                                                height: 40.h,
                                                width: 24.w,
                                              ),
                                            ],
                                          ),
                                          // new Icon(
                                          //   Icons.person_pin,
                                          //   size: 50.0,
                                          //   color: Colors.blue,
                                          // ),
                                          backgroundColor: ColorApp.darkBlue,
                                          progressColor: ColorApp.red,
                                        ),
                                        matchStatistics
                                                    .possession![index].value !=
                                                null
                                            ? matchStatistics.possession![index]
                                                        .value
                                                        .toString() !=
                                                    "premium"
                                                ? MainText(
                                                    text: matchStatistics
                                                            .possession![index]
                                                            .value
                                                            .awayPossession +
                                                        "%",
                                                    font: 17,
                                                    family:
                                                        TextFontApp.boldFont,
                                                  )
                                                : Image.asset(
                                                    AppIcons.premium,
                                                    height: 24,
                                                    width: 24,
                                                  )
                                            : Image.asset(
                                                AppIcons.premium,
                                                height: 24,
                                                width: 24,
                                              )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics!.possession!.length),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.goalsNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.goalsNo![index].value !=
                                      null &&
                                  matchStatistics.goalsNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .goalsNo![index].value.homeGoalsNo) +
                                    double.parse(matchStatistics
                                        .goalsNo![index].value.awayGoalsNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .goalsNo![index]
                                            .value
                                            .homeGoalsNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .goalsNo![index]
                                            .value
                                            .awayGoalsNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam:
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;

                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;

                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics.goalsNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.goalsNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .goalsNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .goalsNo![index]
                                                          .value
                                                          .homeGoalsNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.goalsNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .goalsNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .goalsNo![index]
                                                      .value
                                                      .awayGoalsNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .goalsNo![index].value !=
                                            null
                                        ? matchStatistics.goalsNo![index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.goalsNo!.length),
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.passesNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.passesNo![index].value !=
                                      null &&
                                  matchStatistics.passesNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .passesNo![index].value.homePassesNo) +
                                    double.parse(matchStatistics
                                        .passesNo![index].value.awayPassesNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .passesNo![index]
                                            .value
                                            .homePassesNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .passesNo![index]
                                            .value
                                            .awayPassesNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;

                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics.passesNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.passesNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .passesNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .passesNo![index]
                                                          .value
                                                          .homePassesNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.passesNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .passesNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .passesNo![index]
                                                      .value
                                                      .awayPassesNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .passesNo![index].value !=
                                            null
                                        ? matchStatistics.passesNo![index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.passesNo!.length),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.longPassesNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.longPassesNo![index].value !=
                                      null &&
                                  matchStatistics.longPassesNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .longPassesNo![index]
                                        .value
                                        .homeLongPassesNo) +
                                    double.parse(matchStatistics
                                        .longPassesNo![index]
                                        .value
                                        .awayLongPassesNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .longPassesNo![index]
                                            .value
                                            .homeLongPassesNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .longPassesNo![index]
                                            .value
                                            .awayLongPassesNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .longPassesNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics
                                                  .longPassesNo![index].value !=
                                              null
                                          ? matchStatistics.longPassesNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .longPassesNo![index]
                                                          .value
                                                          .homeLongPassesNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics
                                                  .longPassesNo![index].value !=
                                              null
                                          ? matchStatistics.longPassesNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .longPassesNo![index]
                                                      .value
                                                      .awayLongPassesNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .longPassesNo![index].value !=
                                            null
                                        ? matchStatistics
                                                    .longPassesNo![index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.goalsNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "matchStatistics.crossesOpenPlayNo![index].value: ${matchStatistics.crossesOpenPlayNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics
                                          .crossesOpenPlayNo![index].value !=
                                      null &&
                                  matchStatistics
                                          .crossesOpenPlayNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .crossesOpenPlayNo![index]
                                        .value
                                        .homeCrossesOpenPlayNo) +
                                    double.parse(matchStatistics
                                        .crossesOpenPlayNo![index]
                                        .value
                                        .awayCrossesOpenPlayNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .crossesOpenPlayNo![index]
                                            .value
                                            .homeCrossesOpenPlayNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .crossesOpenPlayNo![index]
                                            .value
                                            .awayCrossesOpenPlayNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 10
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .crossesOpenPlayNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.crossesOpenPlayNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .crossesOpenPlayNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .crossesOpenPlayNo![index]
                                                      .value
                                                      .homeCrossesOpenPlayNo,
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.crossesOpenPlayNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .crossesOpenPlayNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .crossesOpenPlayNo![index]
                                                      .value
                                                      .awayCrossesOpenPlayNo,
                                                  color: ColorApp.red,
                                                  fontWeight: FontWeight.bold,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .crossesOpenPlayNo![index]
                                                .value !=
                                            null
                                        ? matchStatistics
                                                    .crossesOpenPlayNo![index]
                                                    .value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount:
                                matchStatistics.crossesOpenPlayNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.awardedFoulsNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics
                                          .awardedFoulsNo![index].value !=
                                      null &&
                                  matchStatistics.awardedFoulsNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .awardedFoulsNo![index]
                                        .value
                                        .homeAwardedFoulsNo) +
                                    double.parse(matchStatistics
                                        .awardedFoulsNo![index]
                                        .value
                                        .awayAwardedFoulsNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .awardedFoulsNo![index]
                                            .value
                                            .homeAwardedFoulsNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .awardedFoulsNo![index]
                                            .value
                                            .awayAwardedFoulsNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .awardedFoulsNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.awardedFoulsNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .awardedFoulsNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .awardedFoulsNo![index]
                                                      .value
                                                      .homeAwardedFoulsNo,
                                                  color: ColorApp.darkBlue,
                                                  fontWeight: FontWeight.bold,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.awardedFoulsNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .awardedFoulsNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .awardedFoulsNo![index]
                                                      .value
                                                      .awayAwardedFoulsNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .awardedFoulsNo![index].value !=
                                            null
                                        ? matchStatistics.awardedFoulsNo![index]
                                                    .value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.awardedFoulsNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.committedFoulsNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics
                                          .committedFoulsNo![index].value !=
                                      null &&
                                  matchStatistics.committedFoulsNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .committedFoulsNo![index]
                                        .value
                                        .homeCommittedFoulsNo) +
                                    double.parse(matchStatistics
                                        .committedFoulsNo![index]
                                        .value
                                        .awayCommittedFoulsNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .committedFoulsNo![index]
                                            .value
                                            .homeCommittedFoulsNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .committedFoulsNo![index]
                                            .value
                                            .awayCommittedFoulsNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .committedFoulsNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.committedFoulsNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .committedFoulsNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .committedFoulsNo![
                                                              index]
                                                          .value
                                                          .homeCommittedFoulsNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.committedFoulsNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .committedFoulsNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .committedFoulsNo![
                                                              index]
                                                          .value
                                                          .awayCommittedFoulsNo ??
                                                      "",
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .committedFoulsNo![index]
                                                .value !=
                                            null
                                        ? matchStatistics
                                                    .committedFoulsNo![index]
                                                    .value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount:
                                matchStatistics.committedFoulsNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.penaltiesNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.penaltiesNo![index].value !=
                                      null &&
                                  matchStatistics.penaltiesNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .penaltiesNo![index]
                                        .value
                                        .homePenaltiesNo) +
                                    double.parse(matchStatistics
                                        .penaltiesNo![index]
                                        .value
                                        .awayPenaltiesNo);
                                double percentageHomeTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .penaltiesNo![index]
                                            .value
                                            .homePenaltiesNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .penaltiesNo![index]
                                            .value
                                            .awayPenaltiesNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                 maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print( percentageHomeTeam == percentageAwayTeam);
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .penaltiesNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics
                                                  .penaltiesNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .penaltiesNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .penaltiesNo![index]
                                                      .value
                                                      .homePenaltiesNo,
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics
                                                  .penaltiesNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .penaltiesNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .penaltiesNo![index]
                                                      .value
                                                      .awayPenaltiesNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .penaltiesNo![index].value !=
                                            null
                                        ? matchStatistics
                                                    .penaltiesNo![index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.penaltiesNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.cleanSheetsNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.cleanSheetsNo![index].value !=
                                      null &&
                                  matchStatistics.cleanSheetsNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .cleanSheetsNo![index]
                                        .value
                                        .homeCleanSheetsNo) +
                                    double.parse(matchStatistics
                                        .cleanSheetsNo![index]
                                        .value
                                        .awayCleanSheetsNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .cleanSheetsNo![index]
                                            .value
                                            .homeCleanSheetsNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .cleanSheetsNo![index]
                                            .value
                                            .awayCleanSheetsNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .cleanSheetsNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.cleanSheetsNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .cleanSheetsNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .cleanSheetsNo![index]
                                                          .value
                                                          .homeCleanSheetsNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.cleanSheetsNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .cleanSheetsNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .cleanSheetsNo![index]
                                                      .value
                                                      .awayCleanSheetsNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .cleanSheetsNo![index].value !=
                                            null
                                        ? matchStatistics
                                                    .cleanSheetsNo![index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.cleanSheetsNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.ownGoalsNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.ownGoalsNo![index].value !=
                                      null &&
                                  matchStatistics.ownGoalsNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .ownGoalsNo![index]
                                        .value
                                        .homeOwnGoalsNo) +
                                    double.parse(matchStatistics
                                        .ownGoalsNo![index]
                                        .value
                                        .awayOwnGoalsNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .ownGoalsNo![index]
                                            .value
                                            .homeOwnGoalsNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .ownGoalsNo![index]
                                            .value
                                            .awayOwnGoalsNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 10
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text:
                                        matchStatistics.ownGoalsNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics
                                                  .ownGoalsNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .ownGoalsNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .ownGoalsNo![index]
                                                      .value
                                                      .homeOwnGoalsNo,
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics
                                                  .ownGoalsNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .ownGoalsNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .ownGoalsNo![index]
                                                      .value
                                                      .awayOwnGoalsNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .ownGoalsNo![index].value !=
                                            null
                                        ? matchStatistics
                                                    .ownGoalsNo![index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.ownGoalsNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.yellowCardsNo![index].value}");

                              double maxPercentage = 0.0;
                              if (matchStatistics.yellowCardsNo![index].value !=
                                      null &&
                                  matchStatistics.yellowCardsNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .yellowCardsNo![index]
                                        .value
                                        .homeYellowCardsNo) +
                                    double.parse(matchStatistics
                                        .yellowCardsNo![index]
                                        .value
                                        .awayYellowCardsNo);
                                double percentageHomeTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .yellowCardsNo![index]
                                            .value
                                            .homeYellowCardsNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .yellowCardsNo![index]
                                            .value
                                            .awayYellowCardsNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .yellowCardsNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.yellowCardsNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .yellowCardsNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .yellowCardsNo![index]
                                                          .value
                                                          .homeYellowCardsNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  fontWeight: FontWeight.bold,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.yellowCardsNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .yellowCardsNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .yellowCardsNo![index]
                                                      .value
                                                      .awayYellowCardsNo,
                                                  color: ColorApp.red,
                                                  fontWeight: FontWeight.bold,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .yellowCardsNo![index].value !=
                                            null
                                        ? matchStatistics
                                                    .yellowCardsNo![index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.yellowCardsNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.redCardsNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.redCardsNo![index].value !=
                                      null &&
                                  matchStatistics.redCardsNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .redCardsNo![index]
                                        .value
                                        .homeRedCardsNo) +
                                    double.parse(matchStatistics
                                        .redCardsNo![index]
                                        .value
                                        .awayRedCardsNo);
                                double percentageHomeTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .redCardsNo![index]
                                            .value
                                            .homeRedCardsNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .redCardsNo![index]
                                            .value
                                            .awayRedCardsNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text:
                                        matchStatistics.redCardsNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics
                                                  .redCardsNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .redCardsNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .redCardsNo![index]
                                                      .value
                                                      .homeRedCardsNo,
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics
                                                  .redCardsNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .redCardsNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .redCardsNo![index]
                                                      .value
                                                      .awayRedCardsNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .redCardsNo![index].value !=
                                            null
                                        ? matchStatistics
                                                    .redCardsNo![index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.redCardsNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.assistsNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.assistsNo![index].value !=
                                      null &&
                                  matchStatistics.assistsNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .assistsNo![index]
                                        .value
                                        .homeAssistsNo) +
                                    double.parse(matchStatistics
                                        .assistsNo![index].value.awayAssistsNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .assistsNo![index]
                                            .value
                                            .homeAssistsNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .assistsNo![index]
                                            .value
                                            .awayAssistsNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text:
                                        matchStatistics.assistsNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.assistsNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .assistsNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .assistsNo![index]
                                                      .value
                                                      .homeAssistsNo,
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.assistsNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .assistsNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .assistsNo![index]
                                                      .value
                                                      .awayAssistsNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .assistsNo![index].value !=
                                            null
                                        ? matchStatistics
                                                    .assistsNo![index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.assistsNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.savesNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.savesNo![index].value !=
                                      null &&
                                  matchStatistics.savesNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .savesNo![index].value.homeSavesNo) +
                                    double.parse(matchStatistics
                                        .savesNo![index].value.awaySavesNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .savesNo![index]
                                            .value
                                            .homeSavesNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .savesNo![index]
                                            .value
                                            .awaySavesNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? 1 - maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics.savesNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.savesNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .savesNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .savesNo![index]
                                                      .value
                                                      .homeSavesNo,
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.savesNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .savesNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .savesNo![index]
                                                      .value
                                                      .awaySavesNo,
                                                  color: ColorApp.red,
                                                  fontWeight: FontWeight.bold,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .savesNo![index].value !=
                                            null
                                        ? matchStatistics.savesNo![index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.savesNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.cornerNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.cornerNo![index].value !=
                                      null &&
                                  matchStatistics.cornerNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .cornerNo![index].value.homeCornerNo) +
                                    double.parse(matchStatistics
                                        .cornerNo![index].value.awayCornerNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .cornerNo![index]
                                            .value
                                            .homeCornerNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .cornerNo![index]
                                            .value
                                            .awayCornerNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics.cornerNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.cornerNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .cornerNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .cornerNo![index]
                                                          .value
                                                          .homeCornerNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.cornerNo![index].value !=
                                              null
                                          ? matchStatistics
                                                      .cornerNo![index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .cornerNo![index]
                                                      .value
                                                      .awayCornerNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .cornerNo![index].value !=
                                            null
                                        ? matchStatistics.cornerNo![index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.cornerNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.penaltiesMissedNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics
                                          .penaltiesMissedNo![index].value !=
                                      null &&
                                  matchStatistics
                                          .penaltiesMissedNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .penaltiesMissedNo![index]
                                        .value
                                        .homePenaltiesMissedNo) +
                                    double.parse(matchStatistics
                                        .penaltiesMissedNo![index]
                                        .value
                                        .awayPenaltiesMissedNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .penaltiesMissedNo![index]
                                            .value
                                            .homePenaltiesMissedNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .penaltiesMissedNo![index]
                                            .value
                                            .awayPenaltiesMissedNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .penaltiesMissedNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.penaltiesMissedNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .penaltiesMissedNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .penaltiesMissedNo![
                                                              index]
                                                          .value
                                                          .homePenaltiesMissedNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.penaltiesMissedNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .penaltiesMissedNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .penaltiesMissedNo![index]
                                                      .value
                                                      .awayPenaltiesMissedNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .penaltiesMissedNo![index]
                                                .value !=
                                            null
                                        ? matchStatistics
                                                    .penaltiesMissedNo![index]
                                                    .value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount:
                                matchStatistics.penaltiesMissedNo!.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.offsideNo[index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.offsideNo[index].value !=
                                      null &&
                                  matchStatistics.offsideNo[index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .offsideNo[index]
                                        .value
                                        .homeOffsideNo) +
                                    double.parse(matchStatistics
                                        .offsideNo[index].value.awayOffsideNo);
                                double percentageHomeTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .offsideNo[index]
                                            .value
                                            .homeOffsideNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .offsideNo[index]
                                            .value
                                            .awayOffsideNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text:
                                        matchStatistics.offsideNo[index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.offsideNo[index].value !=
                                              null
                                          ? matchStatistics
                                                      .offsideNo[index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .offsideNo[index]
                                                          .value
                                                          .homeOffsideNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.offsideNo[index].value !=
                                              null
                                          ? matchStatistics
                                                      .offsideNo[index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .offsideNo[index]
                                                      .value
                                                      .awayOffsideNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .offsideNo[index].value !=
                                            null
                                        ? matchStatistics
                                                    .offsideNo[index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.offsideNo.length),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.crossesNo[index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics.crossesNo[index].value !=
                                      null &&
                                  matchStatistics.crossesNo[index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .crossesNo[index]
                                        .value
                                        .homeCrossesNo) +
                                    double.parse(matchStatistics
                                        .crossesNo[index].value.awayCrossesNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .crossesNo[index]
                                            .value
                                            .homeCrossesNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .crossesNo[index]
                                            .value
                                            .awayCrossesNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text:
                                        matchStatistics.crossesNo[index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.crossesNo[index].value !=
                                              null
                                          ? matchStatistics
                                                      .crossesNo[index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .crossesNo[index]
                                                          .value
                                                          .homeCrossesNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.crossesNo[index].value !=
                                              null
                                          ? matchStatistics
                                                      .crossesNo[index].value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .crossesNo[index]
                                                      .value
                                                      .awayCrossesNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .crossesNo[index].value !=
                                            null
                                        ? matchStatistics
                                                    .crossesNo[index].value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount: matchStatistics.cornerNo!.length),
                      ),
                      if (matchStatistics.crossSetPiecesNo!.isNotEmpty)
                        SizedBox(
                          height: 10.h,
                        ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.crossSetPiecesNo![index].value}");
                              double maxPercentage = 0.0;
                              if (matchStatistics
                                          .crossSetPiecesNo![index].value !=
                                      null &&
                                  matchStatistics.crossSetPiecesNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .crossSetPiecesNo![index]
                                        .value
                                        .homeCrossSetPiecesNo) +
                                    double.parse(matchStatistics
                                        .crossSetPiecesNo![index]
                                        .value
                                        .awayCrossSetPiecesNo);
                                double percentageHomeTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .crossSetPiecesNo![index]
                                            .value
                                            .homeCrossSetPiecesNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .crossSetPiecesNo![index]
                                            .value
                                            .awayCrossSetPiecesNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .crossSetPiecesNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics.crossSetPiecesNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .crossSetPiecesNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .crossSetPiecesNo![
                                                              index]
                                                          .value
                                                          .homeCrossSetPiecesNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics.crossSetPiecesNo![index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .crossSetPiecesNo![index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .crossSetPiecesNo![index]
                                                      .value
                                                      .awayCrossSetPiecesNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .crossSetPiecesNo![index]
                                                .value !=
                                            null
                                        ? matchStatistics
                                                    .crossSetPiecesNo![index]
                                                    .value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount:
                                matchStatistics.crossSetPiecesNo!.length),
                      ),
                      if (matchStatistics.expectedGoalsAgainstNo!.isNotEmpty)
                        SizedBox(
                          height: 10.h,
                        ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              print(
                                  "value is : ${matchStatistics.expectedGoalsAgainstNo![index].value}");

                              double maxPercentage = 0.0;
                              if (matchStatistics.expectedGoalsAgainstNo![index]
                                          .value !=
                                      null &&
                                  matchStatistics
                                          .expectedGoalsAgainstNo![index].value
                                          .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                        .expectedGoalsAgainstNo![index]
                                        .value
                                        .homeExpectedGoalsAgainstNo) +
                                    double.parse(matchStatistics
                                        .expectedGoalsAgainstNo![index]
                                        .value
                                        .awayExpectedGoalsAgainstNo);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                            .expectedGoalsAgainstNo![index]
                                            .value
                                            .homeExpectedGoalsAgainstNo) /
                                        total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                            .expectedGoalsAgainstNo![index]
                                            .value
                                            .awayExpectedGoalsAgainstNo) /
                                        total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                    percentageHomeTeam > percentageAwayTeam
                                        ? percentageHomeTeam
                                        :
                                    percentageHomeTeam == percentageAwayTeam?
                                    0.5
                                        : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .expectedGoalsAgainstNo![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics
                                                  .expectedGoalsAgainstNo![
                                                      index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .expectedGoalsAgainstNo![
                                                          index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                          .expectedGoalsAgainstNo![
                                                              index]
                                                          .value
                                                          .homeExpectedGoalsAgainstNo ??
                                                      "",
                                                  color: ColorApp.darkBlue,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                      Spacer(),
                                      matchStatistics
                                                  .expectedGoalsAgainstNo![
                                                      index]
                                                  .value !=
                                              null
                                          ? matchStatistics
                                                      .expectedGoalsAgainstNo![
                                                          index]
                                                      .value
                                                      .toString() !=
                                                  "premium"
                                              ? MainText(
                                                  text: matchStatistics
                                                      .expectedGoalsAgainstNo![
                                                          index]
                                                      .value
                                                      .awayExpectedGoalsAgainstNo,
                                                  color: ColorApp.red,
                                                  family: TextFontApp.boldFont,
                                                  font: 15,
                                                )
                                              : Image.asset(
                                                  AppIcons.premium,
                                                  height: 24,
                                                  width: 24,
                                                )
                                          : Image.asset(
                                              AppIcons.premium,
                                              height: 24,
                                              width: 24,
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                                .expectedGoalsAgainstNo![index]
                                                .value !=
                                            null
                                        ? matchStatistics
                                                    .expectedGoalsAgainstNo![
                                                        index]
                                                    .value
                                                    .toString() !=
                                                "premium"
                                            ? maxPercentage
                                            : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                            itemCount:
                                matchStatistics.expectedGoalsAgainstNo!.length),
                      ),
                      if (matchStatistics.passesAccuracy!.isNotEmpty)
                        SizedBox(
                          height: 10.h,
                        ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {


                              double maxPercentage = 0.0;
                              if (matchStatistics.passesAccuracy![index]
                                  .value !=
                                  null &&
                                  matchStatistics
                                      .passesAccuracy![index].value
                                      .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                    .passesAccuracy![index]
                                    .value
                                    .homePassesAccuracy) +
                                    double.parse(matchStatistics
                                        .passesAccuracy![index]
                                        .value
                                        .awayPassesAccuracy);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                    .passesAccuracy![index]
                                    .value
                                    .homePassesAccuracy) /
                                    total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                    .passesAccuracy![index]
                                    .value
                                    .awayPassesAccuracy) /
                                    total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                percentageHomeTeam > percentageAwayTeam
                                    ? percentageHomeTeam
                                    :
                                percentageHomeTeam == percentageAwayTeam?
                                0.5
                                    : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .passesAccuracy![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics
                                          .passesAccuracy![
                                      index]
                                          .value !=
                                          null
                                          ? matchStatistics
                                          .passesAccuracy![
                                      index]
                                          .value
                                          .toString() !=
                                          "premium"
                                          ? MainText(
                                        text: matchStatistics
                                            .passesAccuracy![
                                        index]
                                            .value
                                            .homePassesAccuracy ??
                                            "",
                                        color: ColorApp.darkBlue,
                                        family: TextFontApp.boldFont,
                                        font: 15,
                                      )
                                          : Image.asset(
                                        AppIcons.premium,
                                        height: 24,
                                        width: 24,
                                      )
                                          : Image.asset(
                                        AppIcons.premium,
                                        height: 24,
                                        width: 24,
                                      ),
                                      Spacer(),
                                      matchStatistics
                                          .passesAccuracy![
                                      index]
                                          .value !=
                                          null
                                          ? matchStatistics
                                          .passesAccuracy![
                                      index]
                                          .value
                                          .toString() !=
                                          "premium"
                                          ? MainText(
                                        text: matchStatistics
                                            .passesAccuracy![
                                        index]
                                            .value
                                            .awayPassesAccuracy,
                                        color: ColorApp.red,
                                        family: TextFontApp.boldFont,
                                        font: 15,
                                      )
                                          : Image.asset(
                                        AppIcons.premium,
                                        height: 24,
                                        width: 24,
                                      )
                                          : Image.asset(
                                        AppIcons.premium,
                                        height: 24,
                                        width: 24,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                        .passesAccuracy![index]
                                        .value !=
                                        null
                                        ? matchStatistics
                                        .passesAccuracy![
                                    index]
                                        .value
                                        .toString() !=
                                        "premium"
                                        ? maxPercentage
                                        : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Divider(),
                            ),
                            itemCount:
                            matchStatistics.passesAccuracy!.length),
                      ),
                      if (matchStatistics.attemptsAccuracy!.isNotEmpty)
                        SizedBox(
                          height: 10.h,
                        ),
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {


                              double maxPercentage = 0.0;
                              if (matchStatistics.attemptsAccuracy![index]
                                  .value !=
                                  null &&
                                  matchStatistics
                                      .attemptsAccuracy![index].value
                                      .toString() !=
                                      "premium") {
                                double total = double.parse(matchStatistics
                                    .attemptsAccuracy![index]
                                    .value
                                    .homeAttemptsAccuracy) +
                                    double.parse(matchStatistics
                                        .attemptsAccuracy![index]
                                        .value
                                        .awayAttemptsAccuracy);
                                double percentageHomeTeam = total == 0
                                    ? 0
                                    : (double.parse(matchStatistics
                                    .attemptsAccuracy![index]
                                    .value
                                    .homeAttemptsAccuracy) /
                                    total);
                                double percentageAwayTeam = total == 0
                                    ? 0.0
                                    : (double.parse(matchStatistics
                                    .attemptsAccuracy![index]
                                    .value
                                    .awayAttemptsAccuracy) /
                                    total);
                                print(
                                    "percentageAwayTeam: $percentageAwayTeam");
                                print(
                                    "percentageHomeTeam : $percentageHomeTeam");

                                maxPercentage =
                                percentageHomeTeam > percentageAwayTeam
                                    ? percentageHomeTeam
                                    :
                                percentageHomeTeam == percentageAwayTeam?
                                0.5
                                    : 1 - percentageAwayTeam;
                                print("maxPercentage : $maxPercentage");
                                maxPercentage = maxPercentage > 1.0
                                    ? maxPercentage / 100
                                    : maxPercentage;
                                print("maxPercentage : $maxPercentage");
                              }
                              return Column(
                                children: [
                                  MainText(
                                    text: matchStatistics
                                        .attemptsAccuracy![index].name,
                                    font: 15,
                                    family: TextFontApp.boldFont,
                                  ),
                                  Row(
                                    children: [
                                      matchStatistics
                                          .attemptsAccuracy![
                                      index]
                                          .value !=
                                          null
                                          ? matchStatistics
                                          .attemptsAccuracy![
                                      index]
                                          .value
                                          .toString() !=
                                          "premium"
                                          ? MainText(
                                        text: matchStatistics
                                            .attemptsAccuracy![
                                        index]
                                            .value
                                            .homeAttemptsAccuracy ??
                                            "",
                                        color: ColorApp.darkBlue,
                                        family: TextFontApp.boldFont,
                                        font: 15,
                                      )
                                          : Image.asset(
                                        AppIcons.premium,
                                        height: 24,
                                        width: 24,
                                      )
                                          : Image.asset(
                                        AppIcons.premium,
                                        height: 24,
                                        width: 24,
                                      ),
                                      Spacer(),
                                      matchStatistics
                                          .attemptsAccuracy![
                                      index]
                                          .value !=
                                          null
                                          ? matchStatistics
                                          .attemptsAccuracy![
                                      index]
                                          .value
                                          .toString() !=
                                          "premium"
                                          ? MainText(
                                        text: matchStatistics
                                            .attemptsAccuracy![
                                        index]
                                            .value
                                            .awayAttemptsAccuracy,
                                        color: ColorApp.red,
                                        family: TextFontApp.boldFont,
                                        font: 15,
                                      )
                                          : Image.asset(
                                        AppIcons.premium,
                                        height: 24,
                                        width: 24,
                                      )
                                          : Image.asset(
                                        AppIcons.premium,
                                        height: 24,
                                        width: 24,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  new LinearPercentIndicator(
                                    width: 310.w,
                                    lineHeight: 10.0,
                                    percent: matchStatistics
                                        .attemptsAccuracy![index]
                                        .value !=
                                        null
                                        ? matchStatistics
                                        .attemptsAccuracy![
                                    index]
                                        .value
                                        .toString() !=
                                        "premium"
                                        ? maxPercentage
                                        : 0.5
                                        : 0.0,
                                    progressColor: ColorApp.darkBlue,
                                    backgroundColor: ColorApp.red,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (_, c) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Divider(),
                            ),
                            itemCount:
                            matchStatistics.attemptsAccuracy!.length),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is OfflineState) {
          return OfflinePage();
        } else if (state is ErrorState) {
          return Center(
              child: MainText(
            text: state.msg,
            family: TextFontApp.boldFont,
          ));
        } else {
          return MainText(
            text: LocaleKeys.serverError.tr(),
          );
        }
      },
    );
  }
}
