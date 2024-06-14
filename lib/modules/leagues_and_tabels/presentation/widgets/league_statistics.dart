import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_discipline_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_performance_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_top_assists_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_top_scores_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/leagues_event.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/screens/league_table.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_staistics_scoring.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_statistics_discipline.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_statistics_performance.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/cubit/season/season_cubit.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/drop_down_text_field.dart';
import '../../../../generated/locale_keys.g.dart';
class LeagueStatistics extends StatefulWidget {
  final int leagueId;
  const LeagueStatistics({super.key, required this.leagueId});

  @override
  State<LeagueStatistics> createState() => _LeagueStatisticsState();
}

class _LeagueStatisticsState extends State<LeagueStatistics> {

  int selectedIndex = 0;
  PageController pageController = PageController();
  List pages = [
    LeagueStatisticsScoring(),
    LeagueStatisticsDiscipline(),
    LeagueStatisticsPerformance(),

  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          SizedBox(height: 15,),
          BlocBuilder<SeasonsCubit, BaseState>(
            builder: (context, state) {
              final seasons =
                  BlocProvider.of<SeasonsCubit>(context).seasonModel;
              print("seasons in league statistics  : ${seasons!.data}");
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: DropDownTextField(
                  hint: LocaleKeys.stages.tr(),
                  icon: AppIcons.filter,
                  isModel: true,
                  isFilterMatchTeam: false,
                  items: seasons.data,
                  team: false,
                  country: false,
                  season: true,
                  paddingVer: 5,
                  paddingHor: 0,
                  onChanged: (val) {
                    BlocProvider.of<LeagueTopScoresBloc>(context).seasonId = val;
                    BlocProvider.of<LeagueTopAssistsBloc>(context).seasonId = val;
                    BlocProvider.of<LeagueDisciplineBloc>(context).seasonId = val;
                    BlocProvider.of<LeaguePerformanceBloc>(context).seasonId = val;
                    print(BlocProvider.of<LeagueDisciplineBloc>(context).seasonId);
                    BlocProvider.of<LeagueTopScoresBloc>(context)
                      ..add(GetLeagueTopScores(id: widget.leagueId));
                    BlocProvider.of<LeagueTopAssistsBloc>(context)
                      ..add(GetLeagueTopAssists(id: widget.leagueId));
                    BlocProvider.of<LeagueDisciplineBloc>(context)
                      ..add(GetLeagueDiscipline(id: widget.leagueId));
                    BlocProvider.of<LeaguePerformanceBloc>(context)
                      ..add(GetLeaguePerformance(id: widget.leagueId));
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: ColorApp.borderGray,
                    width: .5
                )
            ),
            child: ButtonsTabBar(
              backgroundColor: ColorApp.yellow,
              unselectedBackgroundColor: ColorApp.white,
              borderWidth: 0,
              contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              borderColor: ColorApp.borderGray,
              labelSpacing: 0,
              radius: 0,
              buttonMargin: EdgeInsets.zero,
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: TextFontApp.boldFont

              ),
              unselectedLabelStyle: TextStyle(
                  color: ColorApp.hintGray,
                  fontSize: 16,
                  fontFamily: TextFontApp.mediumFont
              ),
              // Add your tabs here
              tabs: [
                Tab(text: LocaleKeys.scoring.tr(),),
                Tab(text: LocaleKeys.discipline.tr(),),
                Tab(text: LocaleKeys.performance.tr(),),

              ],
            ),
          ),
              Expanded(
                child: TabBarView(
                  children: [
                    LeagueStatisticsScoring(),
                    LeagueStatisticsDiscipline(),
                    LeagueStatisticsPerformance(),
                
                  ],
                ),
              ),

        ],
      ),
    );
    //   Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    //   child: Column(
    //     children: [
    //       BlocBuilder<SeasonsCubit, BaseState>(
    //         builder: (context, state) {
    //           final seasons =
    //               BlocProvider.of<SeasonsCubit>(context).seasonModel;
    //           print("seasons in league statistics  : ${seasons!.data}");
    //           return DropDownTextField(
    //             hint: LocaleKeys.stages.tr(),
    //             icon: AppIcons.filter,
    //             isModel: true,
    //             isFilterMatchTeam: false,
    //             items: seasons.data,
    //             team: false,
    //             country: false,
    //             season: true,
    //             paddingVer: 5,
    //             paddingHor: 0,
    //             onChanged: (val) {
    //               BlocProvider.of<LeagueTopScoresBloc>(context).seasonId = val;
    //               BlocProvider.of<LeagueTopAssistsBloc>(context).seasonId = val;
    //               BlocProvider.of<LeagueDisciplineBloc>(context).seasonId = val;
    //              BlocProvider.of<LeaguePerformanceBloc>(context).seasonId = val;
    //                print(BlocProvider.of<LeagueDisciplineBloc>(context).seasonId);
    //              BlocProvider.of<LeagueTopScoresBloc>(context)
    //                ..add(GetLeagueTopScores(id: widget.leagueId));
    //               BlocProvider.of<LeagueTopAssistsBloc>(context)
    //                 ..add(GetLeagueTopAssists(id: widget.leagueId));
    //               BlocProvider.of<LeagueDisciplineBloc>(context)
    //                 ..add(GetLeagueDiscipline(id: widget.leagueId));
    //               BlocProvider.of<LeaguePerformanceBloc>(context)
    //                 ..add(GetLeaguePerformance(id: widget.leagueId));
    //             },
    //           );
    //         },
    //       ),
    //       SizedBox(
    //         height: 10.h,
    //       ),
    //       ToggleSwitch(
    //         borderWidth: 0.5,
    //         borderColor: [ColorApp.borderGray],
    //         minHeight: 55.h,
    //         minWidth: 21.sw,
    //         initialLabelIndex: selectedIndex,
    //         cornerRadius: 0,
    //         activeFgColor: Colors.white,
    //         inactiveBgColor: Colors.white,
    //         inactiveFgColor: ColorApp.hintGray,
    //         totalSwitches: 3,
    //         fontSize: 14,
    //         // fontFamily: TextFontApp.semiBoldFont,
    //         labels: [
    //           LocaleKeys.scoring.tr(),
    //           LocaleKeys.discipline.tr(),
    //           LocaleKeys.performance.tr(),
    //
    //         ],
    //         activeBgColor: [ColorApp.yellow, ColorApp.yellow],
    //         onToggle: (index) {
    //           setState(() {
    //             selectedIndex = index!;
    //           });
    //         },
    //       ),
    //       Expanded(child: pages[selectedIndex]),
    //     ],
    //   ),
    // );
  }
}
