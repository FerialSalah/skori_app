import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/top_score_card.dart';

import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/league_top_assists_bloc.dart';
class LeagueTopAssists extends StatelessWidget {
  const LeagueTopAssists({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<LeagueTopAssistsBloc, BaseState>(
      builder: (context, state) {
        final result =
            BlocProvider.of<LeagueTopAssistsBloc>(context).leagueTopAssists;
        print("top assists result:$result");
        if (state is LoadingState) {
          return ColorLoader();
        } else if (state is SuccessState || state is PaginateState) {
          if (result.isEmpty) {
            return emptyShow();
          } else {
            print("total assists in first row:${result[0].totalGoals}");
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  child: MainText(
                    text:  LocaleKeys.topAssists.tr(),
                    font: 18,
                    family: TextFontApp.boldFont,
                    hor: 10.h,

                  ),
                ),
                Container(
                  height: 180.h,
                  color: ColorApp.red,
                  margin: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 40.w,
                                  alignment: Alignment.center,
                                  //  margin: EdgeInsets.symmetric(horizontal: 25.w),
                                  color: ColorApp.yellow,
                                  child: MainText(
                                    text: "1",
                                    center: true,
                                    font: 16,
                                    family: TextFontApp.boldFont,
                                    color: ColorApp.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  width: 120.w,
                                  child: MainText(
                                    text: result[0].player!.name,
                                    font: 12,
                                    family: TextFontApp.boldFont,
                                    color: ColorApp.white,
                                    // overflow: TextOverflow.clip,
                                    // maxLines: 2,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Image.network(
                                      result[0].team!.logo!,
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: MainText(
                                          text: result[0].team!.name!,
                                          font: 12,
                                          family: TextFontApp.semiBoldFont,
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                          color: ColorApp.white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  children: [
                                    MainText(
                                      text: LocaleKeys.assists.tr(),
                                      font: 12,
                                      family: TextFontApp.semiBoldFont,
                                      color: ColorApp.white,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    MainText(
                                      text: LocaleKeys.matches.tr(),
                                      font: 12,
                                      family: TextFontApp.semiBoldFont,
                                      color: ColorApp.white,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    MainText(
                                      text: result[0].totalAssists.toString(),
                                      font: 16,
                                      family: TextFontApp.boldFont,
                                      color: ColorApp.white,
                                      center: true,
                                    ),

                                    SizedBox(
                                      width: 60.w,
                                    ),
                                    MainText(
                                      text: result[0].totalMatches,
                                      font: 16,
                                      family: TextFontApp.boldFont,
                                      color: ColorApp.white,
                                      center: true,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.network(
                                  result[0].player!.avatar!,
                                  height: 150.h,
                                  width: 150.w,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 55,
                  color: ColorApp.darkGray,
                  // width: 350.w,
                  margin: EdgeInsets.only(top: 20.h,right: 5.w,left: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      MainText(
                        text: LocaleKeys.Rk.tr(),
                        font: 12,
                        family: TextFontApp.semiBoldFont,
                        color: ColorApp.black,
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      MainText(
                        text: LocaleKeys.name.tr(),
                        font: 12,
                        family: TextFontApp.semiBoldFont,
                        color: ColorApp.black,
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      MainText(
                        text: LocaleKeys.team.tr(),
                        font: 12,
                        family: TextFontApp.semiBoldFont,
                        color: ColorApp.black,
                      ),
                      SizedBox(
                        width: 60.w,
                      ),
                      MainText(
                        text: LocaleKeys.P.tr(),
                        font: 12,
                        family: TextFontApp.semiBoldFont,
                        color: ColorApp.black,
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      MainText(
                        text:LocaleKeys.G.tr(),
                        font: 12,
                        family: TextFontApp.semiBoldFont,
                        color: ColorApp.black,
                      ),


                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      itemCount: result.length,
                      shrinkWrap: true,
                      primary: false,
                      separatorBuilder: (_, c) => SizedBox(
                        height: 0,
                      ),
                      itemBuilder: (context, index) {
                        return TopScoreCard(
                          leagueTopEntity: result[index], index: index+1,

                        );

                      }),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            );


          }
        } else if (state is OfflineState) {
          return OfflinePage();
        } else {
          return Text("Server error");
        }
      },
    );

  }
}
