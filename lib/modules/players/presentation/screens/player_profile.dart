import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/players/presentation/bloc/history_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/player_info_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/player_statistics_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/players_event.dart';
import 'package:skori/modules/players/presentation/widgets/player_Info.dart';
import 'package:skori/modules/players/presentation/widgets/player_new_statistics.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/theme/color_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/should_sign_up.dart';
import '../../../leagues_and_tabels/presentation/widgets/league_app_bar.dart';
import '../../../../core/injection/injection_app.dart' as di;
import '../bloc/player_news_bloc.dart';
import '../widgets/custom_sliver_app_bar.dart';
import '../widgets/custom_sliver_tabs.dart';
import '../widgets/player_history.dart';
import '../widgets/player_news.dart';
import '../widgets/player_statistics.dart';

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
