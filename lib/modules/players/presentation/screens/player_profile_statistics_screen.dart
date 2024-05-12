import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/core/widgets/offline_widget.dart';
import 'package:skori/modules/players/presentation/bloc/player_statistics_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/players_event.dart';
import 'package:skori/modules/players/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:skori/modules/players/presentation/widgets/player_new_statistic_card.dart';
import 'package:skori/modules/players/presentation/widgets/player_statistic_card.dart';
import 'package:skori/modules/players/presentation/widgets/player_statistics_info.dart';

import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../generated/locale_keys.g.dart';
import '../widgets/custom_sliver_tabs.dart';
import '../widgets/player_performance_card.dart';

class PlayerProfileStatisticsScreen extends StatefulWidget {
  final int id;
  final String name;
  final String avatar;
  final String clubLogo;
  final String clubName;
  final bool isFollow;
  final bool isFav;
  const PlayerProfileStatisticsScreen(
      {Key? key,
      required this.id,
      required this.name,
      required this.avatar,
      required this.clubLogo,
      required this.clubName,
      required this.isFollow,
      required this.isFav})
      : super(key: key);

  @override
  State<PlayerProfileStatisticsScreen> createState() =>
      _PlayerProfileStatisticsScreenState();
}

class _PlayerProfileStatisticsScreenState
    extends State<PlayerProfileStatisticsScreen> {
  @override
  void initState() {
    BlocProvider.of<PlayerStatisticsBloc>(context)..add(GetPlayerNewStatistics(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  CustomSliverAppBar(
                    isPlayerFilter: true,
                    name: widget.name,
                    id: widget.id,
                    type: "player",
                    isFollowing: widget.isFollow,
                    isFav: widget.isFav,
                  ),
                ],
            body: BlocBuilder<PlayerStatisticsBloc, BaseState>(
              builder: (context, state) {
                final playerNewStatistics =
                    BlocProvider.of<PlayerStatisticsBloc>(context)
                        .playerNewStatisticsEntity;
                if (state is LoadingState) {
                  return ColorLoader();
                } else if (state is SuccessState) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        PlayerStatisticsInfo(
                          mainStats: playerNewStatistics!.mainStats!,
                        ),
                        SizedBox(
                          height: 750.h,
                          child: DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  //height: 100.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorApp.borderGray,
                                          width: .5)),
                                  child: ButtonsTabBar(
                                    backgroundColor: ColorApp.yellow,
                                    unselectedBackgroundColor: ColorApp.white,
                                    borderWidth: 0,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 10),
                                    borderColor: ColorApp.borderGray,
                                    labelSpacing: 0,
                                    radius: 0,
                                    buttonMargin: EdgeInsets.zero,
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: TextFontApp.boldFont),
                                    unselectedLabelStyle: TextStyle(
                                        color: ColorApp.hintGray,
                                        fontSize: 16,
                                        fontFamily: TextFontApp.mediumFont),
                                    // Add your tabs here
                                    tabs: [
                                      Tab(
                                        text:
                                            LocaleKeys.featured_statistics.tr(),
                                      ),
                                      Tab(
                                        text: LocaleKeys.other_statistics.tr(),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      PlayerStatisticCard(
                                        statistics:
                                            playerNewStatistics.featuredStats!,
                                        title:
                                            LocaleKeys.featured_statistics.tr(),
                                      ),
                                      ListView(
                                        children: [
                                          PlayerPerformanceCard(
                                            playerPerformance:
                                                playerNewStatistics
                                                    .playerPerformance!,
                                            title: LocaleKeys.playerPerformance
                                                .tr(),
                                          ),
                                          PlayerNewStatisticCard(
                                            statistics:
                                                playerNewStatistics.defensive!,
                                            title: LocaleKeys.defensive.tr(),
                                          ),
                                          PlayerNewStatisticCard(
                                            statistics:
                                                playerNewStatistics.offensive!,
                                            title: LocaleKeys.offensive.tr(),
                                          ),
                                          PlayerNewStatisticCard(
                                            statistics: playerNewStatistics
                                                .administrative!,
                                            title:
                                                LocaleKeys.administrative.tr(),
                                          ),
                                          PlayerNewStatisticCard(
                                            statistics:
                                                playerNewStatistics.ballLost!,
                                            title: LocaleKeys.ballLost.tr(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                  ));
                } else {
                  return MainText(
                    text: LocaleKeys.serverError.tr(),
                  );
                }
              },
            )));
  }
}
