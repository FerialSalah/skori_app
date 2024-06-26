import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/players/presentation/bloc/players_event.dart';
import 'package:skori/modules/players/presentation/widgets/player_new_statistic_card.dart';
import 'package:skori/modules/players/presentation/widgets/player_performance_card.dart';
import 'package:skori/modules/players/presentation/widgets/player_statistic_card.dart';
import 'package:skori/modules/players/presentation/widgets/player_statistics_info.dart';

import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/should_sign_up.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/player_statistics_bloc.dart';
class PlayerNewStatistics extends StatefulWidget {
  final int id;


  const PlayerNewStatistics({Key? key, required this.id,}) : super(key: key);

  @override
  State<PlayerNewStatistics> createState() => _PlayerNewStatisticsState();
}

class _PlayerNewStatisticsState extends State<PlayerNewStatistics> {
  @override
  void initState() {
    BlocProvider.of<PlayerStatisticsBloc>(context)..add(GetPlayerNewStatistics(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerStatisticsBloc, BaseState>(
      builder: (context, state) {
        final playerNewStatistics = BlocProvider.of<PlayerStatisticsBloc>(context)
            .playerNewStatisticsEntity;
        //print("player new statistics: ${playerNewStatistics!.playerPerformance}");
        if (state is LoadingState) {
          return ColorLoader();
        } else if (state is SuccessState) {

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  PlayerStatisticsInfo(mainStats: playerNewStatistics!.mainStats!,),
                  Container(
                   height:500.h,
                    width: 350.w,
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(

                            //height: 100.h,
                            width: 315.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorApp.borderGray, width: .5)),
                            child: ButtonsTabBar(
                              backgroundColor: ColorApp.yellow,
                              unselectedBackgroundColor: ColorApp.white,
                              borderWidth: 0,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 40.w, vertical: 10.h),
                              borderColor: ColorApp.borderGray,
                              labelSpacing: 0,
                              radius: 0,
                              buttonMargin: EdgeInsets.zero,
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: TextFontApp.boldFont),
                              unselectedLabelStyle: TextStyle(
                                  color: ColorApp.hintGray,
                                  fontSize: 14,
                                  fontFamily: TextFontApp.mediumFont),
                              // Add your tabs here
                              tabs: [
                                Tab(
                                  text: LocaleKeys.featured_statistics.tr(),
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

                                SingleChildScrollView(
                                  child: PlayerStatisticCard(
                                    statistics: playerNewStatistics.featuredStats!,
                                    title: LocaleKeys.featured_statistics.tr(),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    // shrinkWrap: true,
                                    // primary: true,
                                    // physics: ScrollPhysics(),
                                    children: [
                                      PlayerPerformanceCard(playerPerformance: playerNewStatistics.playerPerformance!,
                                        title: LocaleKeys.playerPerformance.tr(),),
                                      PlayerNewStatisticCard(
                                        statistics: playerNewStatistics.defensive!,
                                        title: LocaleKeys.defensive.tr(),
                                      ),
                                      PlayerNewStatisticCard(
                                        statistics: playerNewStatistics.offensive!,
                                        title: LocaleKeys.offensive.tr(),
                                      ),
                                      PlayerNewStatisticCard(
                                        statistics: playerNewStatistics.administrative!,
                                        title: LocaleKeys.administrative.tr(),
                                      ),
                                      PlayerNewStatisticCard(
                                        statistics: playerNewStatistics.ballLost!,
                                        title: LocaleKeys.ballLost.tr(),
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
                  ),


                ],
              ),
            ),
          );
        } else if (state is OfflineState) {
          return OfflinePage();
        } else if (state is ErrorState) {
          if(AppStorage.isLogged) return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.not_interested_outlined,color: ColorApp.error,size: 40,),
              SizedBox(
                height: 10.h,
              ),
              MainText(
                text: LocaleKeys.packageUnavailable.tr(),
                font: 15,
                family: TextFontApp.boldFont,
                center: true,
              ),
            ],
          ));
          return ShouldSignUp();

        } else {
          return MainText(
            text: LocaleKeys.serverError.tr(),
          );
        }
      },
    );

  }
}
