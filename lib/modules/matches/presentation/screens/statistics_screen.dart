import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/constant/app_assets.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/modules/matches/presentation/bloc/match_statistics_bloc.dart';
import 'package:skori/modules/matches/presentation/bloc/previous_matches_bloc.dart';
import 'package:skori/modules/matches/presentation/bloc/recent_away_matches_bloc.dart';
import 'package:skori/modules/matches/presentation/bloc/recent_home_matches_bloc.dart';
import 'package:skori/modules/matches/presentation/widgets/match_app_bar.dart';
import 'package:skori/modules/matches/presentation/widgets/match_statistic_card.dart';
import 'package:skori/modules/matches/presentation/widgets/recent_matches.dart';
import '../../../../core/injection/injection_app.dart' as di;

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/images/cached_network_image.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/match_statistics_event.dart';
import '../bloc/recent_matches_event.dart';
import '../widgets/last_head_to_head.dart';
import '../widgets/recent_away_matches.dart';

class StatisticsScreen extends StatefulWidget {
  final int id;
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
  final int homeTeamId;
  final int awayTeamId;
  final String watchLink;
  final String type;
  const StatisticsScreen(
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
      required this.id,
      required this.homeTeamId,
      required this.awayTeamId,
      required this.watchLink,
      required this.type})
      : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  bool recentMatchesAwayIsOpen = true;
  bool recentMatchesHomeIsOpen = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => di.getIt<MatchStatisticsBloc>()
              ..add(GetMatchStatisticsData(matchId: widget.id))),
        BlocProvider(
            create: (context) => di.getIt<RecentHomeMatchesBloc>()
              ..add(GetRecentHomeMatchesData(
                  matchId: widget.id, teamId: widget.homeTeamId))),
        BlocProvider(
            create: (context) => di.getIt<RecentAwayMatchesBloc>()
              ..add(GetRecentAwayMatchesData(
                  matchId: widget.id, teamId: widget.awayTeamId))),
        BlocProvider(
            create: (context) => di.getIt<PreviousMatchesBloc>()
              ..add(GetPreviousMatchesData(
                  matchId: widget.id,
                  homeTeamId: widget.homeTeamId,
                  awayTeamId: widget.awayTeamId))),
      ],
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MatchAppBar(
              title: widget.title,
              homeTeamLogo: widget.homeTeamLogo,
              homeTeamName: widget.homeTeamName,
              homeTeamScore: widget.homeTeamScore,
              stadium: widget.stadium,
              time: widget.time,
              date: widget.date,
              logo: widget.logo,
              currentTime: widget.currentTime,
              awayTeamScore: widget.awayTeamScore,
              awayTeamLogo: widget.awayTeamLogo,
              awayTeamName: widget.awayTeamName,
              watchLink: widget.watchLink,
              type: widget.type,
              homeTeamId: widget.homeTeamId,
              awayTeamId: widget.awayTeamId,
            )
          ],
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MatchStatisticCard(
                  homeTeamLogo: widget.homeTeamLogo,
                  awayTeamLogo: widget.awayTeamLogo,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: MainText(
                    text: LocaleKeys.recentMatches.tr(),
                    family: TextFontApp.boldFont,
                    font: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      recentMatchesHomeIsOpen = !recentMatchesHomeIsOpen;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    height: 50.h,
                    color: ColorApp.white,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40.w,
                          height: 70.h,
                          child: CachedImageNetwork(
                            image: widget.homeTeamLogo,
                          ),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainText(
                              text: widget.homeTeamName,
                              font: 14,
                              family: TextFontApp.semiBoldFont,
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                recentMatchesHomeIsOpen =
                                    !recentMatchesHomeIsOpen;
                              });
                            },
                            icon: Image.asset(
                              recentMatchesHomeIsOpen
                                  ? AppIcons.collapseOpen
                                  : AppIcons.collapseClose,
                              height: 22.h,
                              width: 22.w,
                            )),
                      ],
                    ),
                  ),
                ),
                recentMatchesHomeIsOpen ? RecentMatches() : Container(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      recentMatchesAwayIsOpen = !recentMatchesAwayIsOpen;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    height: 50.h,
                    color: ColorApp.white,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40.w,
                          height: 70.h,
                          child: CachedImageNetwork(
                            image: widget.awayTeamLogo,
                          ),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainText(
                              text: widget.awayTeamName,
                              font: 14,
                              family: TextFontApp.semiBoldFont,
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                recentMatchesAwayIsOpen =
                                    !recentMatchesAwayIsOpen;
                              });
                            },
                            icon: Image.asset(
                              recentMatchesAwayIsOpen
                                  ? AppIcons.collapseOpen
                                  : AppIcons.collapseClose,
                              height: 22.h,
                              width: 22.w,
                            )),
                      ],
                    ),
                  ),
                ),
                recentMatchesAwayIsOpen ? RecentAwayMatches() : Container(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: MainText(
                    text: LocaleKeys.previousMatches.tr(),
                    family: TextFontApp.boldFont,
                    font: 18,
                  ),
                ),
                LastHeadToHeadMatches(),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          // body:  BlocBuilder<TableBloc, BaseState>(
          //   builder: (context, state) {
          //     final result = BlocProvider.of<TableBloc>(context).table;
          //     if (state is LoadingState) {
          //       return ColorLoader();
          //     } else if (state is SuccessState ||state is PaginateState) {
          //       if (result.isEmpty) {
          //         return emptyShow();
          //       } else {
          //         return SingleChildScrollView(
          //           padding: EdgeInsets.symmetric(vertical: 10),
          //           child:  Padding(
          //             padding: EdgeInsets.symmetric(horizontal: 5, vertical: 16),
          //             child: Table(
          //                 columnWidths: {
          //                   0: FlexColumnWidth(.8),
          //                   1: FlexColumnWidth(3.4),
          //                   2: FlexColumnWidth(.8),
          //                   3: FlexColumnWidth(.8),
          //                   4: FlexColumnWidth(.8),
          //                   5: FlexColumnWidth(1),
          //                   6: FlexColumnWidth(1),
          //                   7: FlexColumnWidth(.8),
          //                 },
          //                 defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          //                 // border: TableBorder.all(color: Colors.black),
          //                 border: TableBorder(
          //                     horizontalInside:
          //                     BorderSide(color: ColorApp.borderGray, width: .5),
          //                     top: BorderSide(color: ColorApp.borderGray, width: .5),
          //                     bottom:
          //                     BorderSide(color: ColorApp.borderGray, width: .5),
          //                     right:
          //                     BorderSide(color: ColorApp.borderGray, width: .5),
          //                     left: BorderSide(color: ColorApp.borderGray, width: .5)
          //                   // outside: BorderSide(color: ColorApp.borderGray,width: .5)
          //                 ),
          //                 children: [
          //                   leagueTableHeader(),
          //
          //                   ...result.asMap().entries.map((e){
          //                     return  leagueTableRow(
          //                       id: e.value.id,
          //                       logo: e.value.logo,
          //                       name: e.value.name,
          //                       index: e.key+1,
          //                       pts: e.value.points,
          //                       win: e.value.win,
          //                       lose: e.value.lose,
          //                       draw: e.value.draw,
          //                       matchesNum: e.value.matchesNum,
          //                       scoreGoal: e.value.scoreGoal,
          //                       reverseGoal: e.value.reverseGoal,
          //                       differentGoal: e.value.differentGoal,
          //                       isFav: e.value.isFavorite,
          //                       isFollowing: e.value.isFavorite,
          //                       countryFlag: e.value.countryFlag,
          //                       countryName: e.value.countryName,
          //
          //                     );
          //                   }).toList(),
          //
          //                 ]),
          //           ),
          //         );
          //       }
          //     } else if (state is OfflineState) {
          //       return OfflinePage();
          //     } else {
          //       return Text("Server error");
          //     }
          //
          //   },
          // )
        ),
      ),
    );
  }
}
