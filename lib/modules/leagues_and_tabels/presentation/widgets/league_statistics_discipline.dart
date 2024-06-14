import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/app_storage/app_storage.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_discipline_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_discipline_tab_header.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_discipline_table_row.dart';

import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import 'league_discipline_card.dart';
import 'league_table_header.dart';
import 'league_table_row.dart';

class LeagueStatisticsDiscipline extends StatelessWidget {
  const LeagueStatisticsDiscipline({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeagueDisciplineBloc, BaseState>(
      builder: (context, state) {
        final result =
            BlocProvider.of<LeagueDisciplineBloc>(context).leagueDiscipline;
        print("disciplines result:$result");
        if (state is LoadingState) {
          return ColorLoader();
        } else if (state is SuccessState || state is PaginateState) {
          if (result.isEmpty) {
            return emptyShow();
          } else {
            return Column(
              children: [
                Container(
                  height: 55,
                  color: ColorApp.darkBlue,
                  // width: 350.w,
                  margin: EdgeInsets.only(top: 20.h, right: 5.w, left: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          SizedBox(
                            width: 40.w,
                            child: MainText(
                              text: LocaleKeys.Rk.tr(),
                              font: 12,
                              family: TextFontApp.semiBoldFont,
                              color: ColorApp.white,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          SizedBox(
                            width: 40.w,
                            child: MainText(
                              text: LocaleKeys.team.tr(),
                              font: 12,
                              family: TextFontApp.semiBoldFont,
                              color: ColorApp.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   width: 10.w,
                          // ),

                          // SizedBox(
                          //   width: 40.w,
                          // ),
                          SizedBox(
                              //width:context.locale.languageCode=='ar'?50.w:50.w,
                              width: 60.w),
                          SizedBox(
                            width: 40.w,
                            child: MainText(
                              text: LocaleKeys.P.tr(),
                              font: 12,
                              family: TextFontApp.semiBoldFont,
                              color: ColorApp.white,
                            ),
                          ),
                          // SizedBox(
                          //   width:context.locale.languageCode=='ar'?10.w:50.w,
                          //
                          // ),
                          SizedBox(
                            width: 60.w,
                            child: MainText(
                              text: LocaleKeys.yc.tr(),
                              font: 11,
                              family: TextFontApp.semiBoldFont,
                              color: ColorApp.white,
                            ),
                          ),
                          // SizedBox(
                          //   width:context.locale.languageCode=='ar'?10.w:50.w,
                          //
                          // ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          SizedBox(
                            width: 55.w,
                            child: MainText(
                              text: LocaleKeys.rc.tr(),
                              font: 11,
                              family: TextFontApp.semiBoldFont,
                              color: ColorApp.white,
                            ),
                          ),
                          // SizedBox(
                          //   width:context.locale.languageCode=='ar'?10.w:40.w,
                          //
                          // ),
                          SizedBox(
                            width: 45.w,
                            child: MainText(
                              text: LocaleKeys.pts.tr(),
                              font: 11,
                              family: TextFontApp.semiBoldFont,
                              color: ColorApp.white,
                            ),
                          ),
                        ],
                      )
                      // SizedBox(
                      //     width:context.locale.languageCode=='ar'?5.w:20.w,
                      //
                      // )
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
                        return LeagueDisciplineCard(
                          leagueDisciplineEntity: result[index],
                          index: index,
                        );
                      }),
                ),
                SizedBox(
                  height: 50,
                ),
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
