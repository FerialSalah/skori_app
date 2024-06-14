import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/cubit/gallery/league_gallery_cubit.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_news_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_top_assists_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_top_scores_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/screens/league_gallery_screen.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/screens/league_matches.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_news.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/widgets/league_statistics.dart';
import 'package:skori/modules/matches/presentation/screens/matches.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/matches_bloc.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../nav_bar/presentation/bloc/matches_event.dart';
import '../../../players/presentation/widgets/custom_sliver_app_bar.dart';
import '../../../players/presentation/widgets/custom_sliver_tabs.dart';
import '../bloc/league_discipline_bloc.dart';
import '../bloc/league_performance_bloc.dart';
import '../bloc/leagues_bloc.dart';
import '../bloc/leagues_event.dart';
import '../../../../core/injection/injection_app.dart' as di;
import '../bloc/table_bloc.dart';
import 'league_rinks_screen.dart';
import 'league_table.dart';

class LeagueProfileScreen extends StatefulWidget {
  final int id;
  final String logo;
  final String name;
  final String continent;
  final String season;
  final bool isFollowing;
  final bool isFav;
  const LeagueProfileScreen(
      {super.key,
      required this.id,
      required this.logo,
      required this.name,
      required this.continent,
      required this.isFollowing,
      required this.isFav,
      required this.season});

  @override
  State<LeagueProfileScreen> createState() => _LeagueProfileScreenState();
}

class _LeagueProfileScreenState extends State<LeagueProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // BlocProvider.of<PlayerSeasonsCubit>(context)..getPlayerSeasons(widget.id);
    // BlocProvider.of<PlayerLeaguesCubit>(context)..getPlayerLeagues(widget.id);
    BlocProvider.of<MatchesBloc>(context).tournamentId=widget.id.toString();
    BlocProvider.of<LeagueGalleryCubit>(context)..getLeagueGallery(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
            di.getIt<TableBloc>()..add(GetTableData(id: widget.id))),
        BlocProvider(
            create: (context) =>
            di.getIt<LeagueNewsBloc>()..add(GetLeagueNews(id: widget.id))),
        BlocProvider(
            create: (context) =>
            di.getIt<LeagueTopScoresBloc>()..add(GetLeagueTopScores(id: widget.id))),
        BlocProvider(
            create: (context) =>
            di.getIt<LeagueTopAssistsBloc>()..add(GetLeagueTopAssists(id: widget.id))),
        BlocProvider(
            create: (context) =>
            di.getIt<LeagueDisciplineBloc>()..add(GetLeagueDiscipline(id: widget.id))),
        BlocProvider(
            create: (context) =>
            di.getIt<LeaguePerformanceBloc>()..add(GetLeaguePerformance(id: widget.id))),
        // BlocProvider(
        //     create: (context) =>
        //     di.getIt<MatchesBloc>()..add(GetMatchesData())),

        // BlocProvider(
        //     create: (context) => di.getIt<TeamStatisticsBloc>()
        //       ..add(GetTeamStatistics(id: widget.id))),
        // BlocProvider(
        //     create: (context) =>
        //     di.getIt<TeamNewsBloc>()..add(GetTeamNews(id: widget.id))),
        // BlocProvider(
        //     create: (context) => di.getIt<TeamPlayersBloc>()
        //       ..add(GetTeamPlayers(id: widget.id))),
        // BlocProvider(
        //     create: (context) =>
        //     di.getIt<TeamGalleryCubit>()..getTeamGallery(widget.id)),
      ],
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
            body: NestedScrollView(
          physics: ClampingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            CustomSliverAppBar(
              isPlayerFilter: false,
              name: widget.name,
              id: widget.id,
              type: "league",
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
              clubName: '',
              clubLogo: '',
              tabsTitle: [
                LocaleKeys.rink.tr(),
                LocaleKeys.latestNews.tr(),
                LocaleKeys.statistics.tr(),
                LocaleKeys.matches.tr(),
                LocaleKeys.gallery.tr()
              ],
            ),
          ],
          body: TabBarView(
            physics: ClampingScrollPhysics(),
            children: [
              //LeagueTableScreen(),
              LeagueRinksScreen(),
              LeagueNews(leagueId: widget.id),
              LeagueStatistics(leagueId: widget.id,),
              LeagueMatches(tournmentId: widget.id,),
              LeagueGalleryScreen()
            ],
          ),
        )),
      ),
    );
  }
}
