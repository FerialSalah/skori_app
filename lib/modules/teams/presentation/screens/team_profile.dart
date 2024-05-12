import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/teams/presentation/bloc/team_event.dart';
import 'package:skori/modules/teams/presentation/bloc/team_news_bloc.dart';
import 'package:skori/modules/teams/presentation/widgets/team_news.dart';
import 'package:skori/modules/teams/presentation/widgets/team_statistics.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/theme/color_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/should_sign_up.dart';
import '../../../leagues_and_tabels/presentation/widgets/league_app_bar.dart';
import '../../../../core/injection/injection_app.dart' as di;
import '../../../players/presentation/widgets/custom_sliver_app_bar.dart';
import '../../../players/presentation/widgets/custom_sliver_tabs.dart';
import '../bloc/team_matches_bloc.dart';
import '../bloc/team_player_bloc.dart';
import '../bloc/team_statistics_bloc.dart';
import '../widgets/team_matches.dart';
import '../widgets/team_players.dart';

class TeamProfile extends StatefulWidget {
  final int id;
  final String name;
  final String logo;
  final String season;
  final String countryFlag;
  final String countryName;
  final bool isFollowing;
  final bool isFav;

  const TeamProfile({
    Key? key,
    required this.id,
    required this.name,
    required this.logo,
    required this.countryFlag,
    required this.countryName,
    required this.isFollowing,
    required this.isFav,
    required this.season,
  }) : super(key: key);

  @override
  State<TeamProfile> createState() => _TeamProfileState();
}

class _TeamProfileState extends State<TeamProfile>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => di.getIt<TeamMatchesBloc>()
              ..add(GetTeamMatches(id: widget.id))),
        BlocProvider(
            create: (context) => di.getIt<TeamStatisticsBloc>()
              ..add(GetTeamStatistics(id: widget.id))),
        BlocProvider(
            create: (context) =>
                di.getIt<TeamNewsBloc>()..add(GetTeamNews(id: widget.id))),
        BlocProvider(
            create: (context) => di.getIt<TeamPlayersBloc>()
              ..add(GetTeamPlayers(id: widget.id))),
      ],
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
            body: NestedScrollView(
          physics: ClampingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            CustomSliverAppBar(
              isPlayerFilter: false,
              name: widget.name,
              id: widget.id,
              type: "team",
              isFav: widget.isFav,
              isFollowing: widget.isFollowing,
            ),
            CustomSliverLogo(
              expandedHeight: 200.h,
              name: widget.name,
              logo: widget.logo,
              season: widget.season,
              continent: '',
              tabController: tabController,
              clubName: widget.countryName,
              clubLogo: widget.countryFlag,
              tabsTitle: [
                LocaleKeys.teamMatches.tr(),
                LocaleKeys.statistics.tr(),
                LocaleKeys.latestNews.tr(),
                LocaleKeys.teamPlayers.tr()
              ],
            ),
          ],
          body: TabBarView(
            physics: ClampingScrollPhysics(),
            children: [
              TeamMatches(),
              TeamStatistics(),
              TeamNews(),
              TeamPlayers(
                teamId: widget.id,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
