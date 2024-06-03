import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/empty.dart';
import 'package:skori/core/widgets/offline_widget.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/matches/presentation/bloc/recent_home_matches_bloc.dart';
import 'package:skori/modules/nav_bar/presentation/widgets/matches_card.dart';

import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/main_text.dart';
class RecentMatches extends StatefulWidget {
  const RecentMatches({Key? key}) : super(key: key);

  @override
  State<RecentMatches> createState() => _RecentMatchesState();
}

class _RecentMatchesState extends State<RecentMatches> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentHomeMatchesBloc, BaseState>(
      builder: (context, state) {
        final recentMatches =
            BlocProvider.of<RecentHomeMatchesBloc>(context).recentHomeMatches;

        if (state is LoadingState) {
          return ColorLoader();
        } else if (state is SuccessState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              recentMatches.isEmpty
                  ? emptyShow()
                  : SizedBox(
                height: 200.h,
                child: ListView.separated(
                    shrinkWrap: true,

                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    itemBuilder: (context, index) => MatchesCard(
                      isMatchScreen: false,
                      homeTeamId: recentMatches[index].homeTeamId,
                      awayTeamId: recentMatches[index].awayTeamId,
                      id: recentMatches[index].id,
                      title:recentMatches[index].season,
                      type:recentMatches[index].type ,
                      watchLink: recentMatches[index].watchLink,
                      homeTeamName: recentMatches[index].homeTeamName,
                      homeTeamScore: recentMatches[index].homeTeamScore,
                      homeTeamLogo: recentMatches[index].homeTeamLogo,
                      awayTeamName: recentMatches[index].awayTeamName,
                      awayTeamScore: recentMatches[index].awayTeamScore,
                      awayTeamLogo: recentMatches[index].awayTeamLogo,
                      logo: recentMatches[index].logo,
                      time: recentMatches[index].time,
                      date: recentMatches[index].date,
                      currentTime: recentMatches[index].currentTime,
                      stadium: recentMatches[index].stadium,

                    ),
                    separatorBuilder: (context, _) => SizedBox(
                      height: 10.h,
                    ),
                    itemCount: recentMatches.length),
              ),

            ],
          );
        } else if (state is OfflineState) {
          return OfflinePage();
        } else if (state is ErrorState) {
          return Center(
              child: MainText(
                text: state.msg,
                family: TextFontApp.boldFont,
              ));
        } else {
          return MainText(
            text: LocaleKeys.serverError.tr(),
          );
        }
      },
    );

  }
}
