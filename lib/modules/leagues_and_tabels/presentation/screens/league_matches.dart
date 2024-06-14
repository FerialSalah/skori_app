import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../../nav_bar/presentation/bloc/matches_bloc.dart';
import '../../../nav_bar/presentation/bloc/matches_event.dart';
import '../../../nav_bar/presentation/widgets/filter_sheet.dart';
import '../../../nav_bar/presentation/widgets/matches_card.dart';
import '../widgets/league_matches_filter.dart';

class LeagueMatches extends StatefulWidget {
  final int tournmentId;
  const LeagueMatches({super.key, required this.tournmentId});

  @override
  State<LeagueMatches> createState() => _LeagueMatchesState();
}

class _LeagueMatchesState extends State<LeagueMatches> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {


    BlocProvider.of<MatchesBloc>(context).tournamentId =
        widget.tournmentId.toString();
    BlocProvider.of<MatchesBloc>(context)..add(GetMatchesData());
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await BlocProvider.of<MatchesBloc>(context)
          ..add(MatchesPagination());
        // await BlocProvider.of<CountriesCubit>(context).getCountries();
        //
        // await BlocProvider.of<SeasonsCubit>(context).getSeasons();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesBloc, BaseState>(
      builder: (context, state) {
        final result = BlocProvider.of<MatchesBloc>(context).matches;

        if (state is LoadingState) {
          return ShimmerWidget();
        } else if (state is SuccessState || state is PaginateState) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainText(
                        text: LocaleKeys.matches.tr(),
                        family: TextFontApp.boldFont,
                        font: 16),
                    GestureDetector(
                        onTap: () {
                          showSlidingBottomSheet(context, builder: (_) {
                            return SlidingSheetDialog(
                                elevation: 8,
                                cornerRadius: 16,
                                snapSpec: SnapSpec(
                                  snap: true,
                                  snappings: [1.0, 1.0],
                                  positioning:
                                      SnapPositioning.relativeToAvailableSpace,
                                ),
                                builder: (_, state) {
                                  return FilterLeagueMatchesSheet();
                                });
                          });
                        },
                        child: Image.asset(
                          AppIcons.filter,
                          height: 20.h,
                          width: 20.w,
                        ))
                  ],
                ),
              ),
              result.isEmpty
                  ? emptyShow()
                  : Expanded(
                      child: ListView.separated(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                          ),
                          itemBuilder: (context, index) => MatchesCard(
                                isMatchScreen: true,
                                homeTeamId: result[index].homeTeamId,
                                awayTeamId: result[index].awayTeamId,
                                id: result[index].id,
                                title: result[index].season,
                                type: result[index].type,
                                watchLink: result[index].watchLink,
                                homeTeamName: result[index].homeTeamName,
                                homeTeamScore: result[index].homeTeamScore,
                                homeTeamLogo: result[index].homeTeamLogo,
                                awayTeamName: result[index].awayTeamName,
                                awayTeamScore: result[index].awayTeamScore,
                                awayTeamLogo: result[index].awayTeamLogo,
                                logo: result[index].logo,
                                time: result[index].time,
                                date: result[index].date,
                                currentTime: result[index].currentTime,
                                stadium: result[index].stadium,
                              ),
                          separatorBuilder: (context, _) => SizedBox(
                                height: 10.h,
                              ),
                          itemCount: result.length),
                    ),
              if (state is PaginateState) ColorLoader(),
              SizedBox(
                height: 50,
              ),
            ],
          );
        } else if (state is OfflineState) {
          return OfflinePage();
        } else {
          return Text("Server error");
        }
      },
    );
  }
}
