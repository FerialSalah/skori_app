import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/cubit/player_league/player_leagues_cubit.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/players/presentation/widgets/player_Info.dart';
import 'package:skori/modules/players/presentation/widgets/player_new_statistics.dart';
import '../../../../core/cubit/season/player_season_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_sliver_app_bar.dart';
import '../widgets/custom_sliver_tabs.dart';
import '../widgets/player_history.dart';
import '../widgets/player_news.dart';

class PlayerProfile extends StatefulWidget {
  final int id;
  final String name;
  final String avatar;
  final String clubLogo;
  final String clubName;
  final bool isFollow;
  final bool isFav;

  const PlayerProfile(
      {Key? key,
      required this.id,
      required this.name,
      required this.avatar,
      required this.clubLogo,
      required this.clubName, required this.isFollow, required this.isFav})
      : super(key: key);

  @override
  State<PlayerProfile> createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    BlocProvider.of<PlayerSeasonsCubit>(context)..getPlayerSeasons(widget.id);
    BlocProvider.of<PlayerLeaguesCubit>(context)..getPlayerLeagues(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          physics: ClampingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) =>[
            CustomSliverAppBar(
              isPlayerFilter: true,
              name: widget.name,
              id: widget.id,
              type: "player",
              isFollowing: widget.isFollow,
              isFav: widget.isFav,
            ),
            CustomSliverLogo(
              expandedHeight: 210.h,
              name: widget.name,
              logo: widget.avatar,
              continent: '',
              season: '',
              tabController: tabController,
              clubName: widget.clubName,
              clubLogo: widget.clubLogo,
              tabsTitle: [LocaleKeys.playerInfo.tr(),LocaleKeys.statistics.tr(),LocaleKeys.playerContent.tr(),
                LocaleKeys.playerHistory.tr()],
            ),
          ],
          body: TabBarView(
            physics: ClampingScrollPhysics(),
              children: [
                PlayerInfo(id: widget.id,),
                PlayerNewStatistics(id: widget.id),
                NewsOfPlayer(id: widget.id,),
                PlayerHistory(id: widget.id,),
              ]),
        ),
      ),
    );
  }
}
