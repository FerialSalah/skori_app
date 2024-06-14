import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_top_entity.dart';

import '../../../../core/theme/color_app.dart';

class LeagueTopScoresItem extends StatelessWidget {
  final List<LeagueTopEntity> leaguesTopScores;
  const LeagueTopScoresItem({super.key, required this.leaguesTopScores});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   height: 180,
          //   color: ColorApp.darkBlue,
          //   child: Column(
          //     children: [
          //       Container(
          //         margin: EdgeInsets.symmetric(horizontal: 10.w),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Column(
          //               children: [
          //                 Container(
          //                   height: 40.h,
          //                   width: 40.w,
          //                   alignment: Alignment.center,
          //                   //  margin: EdgeInsets.symmetric(horizontal: 25.w),
          //                   color: ColorApp.yellow,
          //                   child: MainText(
          //                     text: "1",
          //                     center: true,
          //                     font: 16,
          //                     family: TextFontApp.boldFont,
          //                     color: ColorApp.white,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 10.h,
          //                 ),
          //                 SizedBox(
          //                   width: 100.w,
          //                   child: MainText(
          //                     text: leaguesTopScores[0].player!.name,
          //                     font: 12,
          //                     family: TextFontApp.boldFont,
          //                     color: ColorApp.white,
          //                     // overflow: TextOverflow.clip,
          //                     // maxLines: 2,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 10.h,
          //                 ),
          //                 Row(
          //                   children: [
          //                     Image.network(
          //                       leaguesTopScores[0].team!.logo!,
          //                       height: 24,
          //                       width: 24,
          //                     ),
          //                     SizedBox(
          //                       width: 5,
          //                     ),
          //                     SizedBox(
          //                       width: 80,
          //                       child: MainText(
          //                           text: leaguesTopScores[0].team!.name!,
          //                           font: 12,
          //                           family: TextFontApp.semiBoldFont,
          //                           overflow: TextOverflow.clip,
          //                           maxLines: 2,
          //                           color: ColorApp.white),
          //                     ),
          //                   ],
          //                 ),
          //                 Row(
          //                   children: [
          //                     MainText(
          //                       text: LocaleKeys.goals,
          //                       font: 12,
          //                       family: TextFontApp.semiBoldFont,
          //                       color: ColorApp.white,
          //                     ),
          //                     SizedBox(
          //                       width: 5.w,
          //                     ),
          //                     MainText(
          //                       text: LocaleKeys.matches,
          //                       font: 12,
          //                       family: TextFontApp.semiBoldFont,
          //                       color: ColorApp.white,
          //                     )
          //                   ],
          //                 ),
          //                 Row(
          //                   children: [
          //                     MainText(
          //                       text: leaguesTopScores[0].totalGoals.toString(),
          //                       font: 12,
          //                       family: TextFontApp.semiBoldFont,
          //                       color: ColorApp.white,
          //                     ),
          //                     SizedBox(
          //                       width: 10.w,
          //                     ),
          //                     MainText(
          //                       text: leaguesTopScores[0].totalMatches,
          //                       font: 12,
          //                       family: TextFontApp.semiBoldFont,
          //                       color: ColorApp.white,
          //                     )
          //                   ],
          //                 )
          //               ],
          //             ),
          //             Column(
          //               children: [
          //                 Image.network(
          //                   leaguesTopScores[0].player!.avatar!,
          //                   height: 100,
          //                   width: 200,
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Expanded(
            child: SizedBox(
              height: 150,
              child: ListView.separated(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  itemCount: leaguesTopScores.length,
                  shrinkWrap: true,
                  primary: false,
                  separatorBuilder: (_, c) => SizedBox(
                        height: 0,
                      ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 55,
                          color: ColorApp.darkBlue,
                          width: 350.w,
                          margin: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 10.w),
                                  child: MainText(
                                    text: "Rk",
                                    font: 12,
                                    family: TextFontApp.semiBoldFont,
                                    color: ColorApp.white,
                                  )),
                              Container(
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 10.w),
                                  child: MainText(
                                    text: LocaleKeys.name.tr(),
                                    font: 12,
                                    family: TextFontApp.semiBoldFont,
                                    color: ColorApp.white,
                                  )),
                              Center(
                                  child: MainText(
                                    text: LocaleKeys.team.tr(),
                                    font: 12,
                                    family: TextFontApp.semiBoldFont,
                                    color: ColorApp.white,
                                  )),
                              Container(
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 10.w),
                                  child: MainText(
                                    text: "P",
                                    font: 12,
                                    family: TextFontApp.semiBoldFont,
                                    color: ColorApp.white,
                                  )),
                              Container(
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 10.w),
                                  child: MainText(
                                    text: "G",
                                    font: 12,
                                    family: TextFontApp.semiBoldFont,
                                    color: ColorApp.white,
                                  )),

                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                              physics: ScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5),
                              itemCount: leaguesTopScores.length,

                              shrinkWrap: true,
                              primary: false,
                              separatorBuilder: (_, c) => SizedBox(
                                height: 0,
                              ),
                              itemBuilder: (context, index) {
                                return Container();
                                //   LeaguePerformanceCard(
                                //   index: index,
                                //   leaguePerformanceEntity: result[index],
                                // );
                              }),
                        ),
                      ],
                    );
                    //   LeaguePerformanceCard(
                    //   index: index,
                    //   leaguePerformanceEntity: result[index],
                    // );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
