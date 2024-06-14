import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_performance_card.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_performance_table_row.dart';

import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/league_performance_bloc.dart';

class LeagueStatisticsPerformance extends StatelessWidget {
  const LeagueStatisticsPerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaguePerformanceBloc, BaseState>(
      builder: (context, state) {
        final result =
            BlocProvider.of<LeaguePerformanceBloc>(context).leaguePerformance;
        print("performances result:$result");
        if (state is LoadingState) {
          return ColorLoader();
        } else if (state is SuccessState || state is PaginateState) {
          if (result.isEmpty) {
            return emptyShow();
          } else {
            print("total scores in first row:${result[0].totalScores}");
            return Column(
              children: [
                Container(
                  height: 55,
                  color: ColorApp.darkBlue,
                  // width: 350.w,
                  margin: EdgeInsets.only(top: 20.h, right: 5.w, left: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          child: MainText(
                            text: LocaleKeys.performanceDate.tr(),
                            font: 12,
                            family: TextFontApp.semiBoldFont,
                            color: ColorApp.white,
                          )),
                      MainText(
                        text: LocaleKeys.teams.tr(),
                        font: 12,
                        family: TextFontApp.semiBoldFont,
                        color: ColorApp.white,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          child: MainText(
                            text: LocaleKeys.scores.tr(),
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
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      itemCount: result.length,
                      shrinkWrap: true,
                      primary: false,
                      separatorBuilder: (_, c) => SizedBox(
                            height: 0,
                          ),
                      itemBuilder: (context, index) {
                        return LeaguePerformanceCard(
                          index: index,
                          leaguePerformanceEntity: result[index],
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
