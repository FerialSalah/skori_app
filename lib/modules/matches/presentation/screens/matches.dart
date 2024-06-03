import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/constant/constants.dart';
import 'package:skori/core/cubit/country/country_cubit.dart';
import 'package:skori/core/cubit/season/season_cubit.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/matches_bloc.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/matches_event.dart';
import 'package:skori/modules/nav_bar/presentation/widgets/filter_sheet.dart';
import 'package:skori/modules/nav_bar/presentation/widgets/matches_card.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/main_text.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await BlocProvider.of<MatchesBloc>(context)
          ..add(MatchesPagination());
        await BlocProvider.of<CountriesCubit>(context).getCountries();

       await BlocProvider.of<SeasonsCubit>(context).getSeasons();


      }
    });

    super.initState();
    // scrollController = ScrollController()..addListener(_scrollListener);
  }

  void setDate(DateTime? date) {
    BlocProvider.of<MatchesBloc>(context).date = reformatDate(date);
    BlocProvider.of<MatchesBloc>(context)..add(GetMatchesData());
    print(BlocProvider.of<MatchesBloc>(context).date);


  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.appBarWithFilter(
            title: LocaleKeys.matches.tr(),
            onTap: () {
              showSlidingBottomSheet(context, builder: (_) {
                return SlidingSheetDialog(
                    elevation: 8,
                    cornerRadius: 16,
                    snapSpec: SnapSpec(
                      snap: true,
                      snappings: [1.0, 1.0],
                      positioning: SnapPositioning.relativeToAvailableSpace,
                    ),
                    builder: (_, state) {
                      return FilterSheet();
                    });
              });
            }),
        body: BlocBuilder<MatchesBloc, BaseState>(
          builder: (context, state) {
            final result = BlocProvider.of<MatchesBloc>(context).matches;

            if (state is LoadingState) {
              return ShimmerWidget();
            } else if (state is SuccessState || state is PaginateState) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<MatchesBloc>(context).date = "";
                              BlocProvider.of<MatchesBloc>(context).teamId = "";
                              BlocProvider.of<MatchesBloc>(context)
                                  .tournamentId = "";
                              BlocProvider.of<MatchesBloc>(context)
                                  .countryId = "";
                              BlocProvider.of<MatchesBloc>(context)
                                ..add(GetMatchesData());
                            },
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: BlocProvider.of<MatchesBloc>(context)
                                            .date ==
                                        ""
                                    ? ColorApp.yellow
                                    : ColorApp.white,
                                border: Border.all(
                                    color: ColorApp.borderGray, width: 1),
                              ),
                              child: Center(
                                  child: MainText(
                                text: LocaleKeys.all.tr(),
                                font: 12,
                                family: TextFontApp.mediumFont,
                                color: BlocProvider.of<MatchesBloc>(context)
                                            .date ==
                                        ""
                                    ? ColorApp.white
                                    : ColorApp.black,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setDate(
                                  DateTime.now().subtract(Duration(days: 1)));
                            },
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: BlocProvider.of<MatchesBloc>(context)
                                            .date ==
                                        reformatDate(DateTime.now()
                                            .subtract(Duration(days: 1)))
                                    ? ColorApp.yellow
                                    : ColorApp.white,
                                border: Border.all(
                                    color: ColorApp.borderGray, width: 1),
                              ),
                              child: Center(
                                  child: MainText(
                                text: LocaleKeys.yesterday.tr(),
                                font: 12,
                                family: TextFontApp.mediumFont,
                                color: BlocProvider.of<MatchesBloc>(context)
                                            .date ==
                                        reformatDate(DateTime.now()
                                            .subtract(Duration(days: 1)))
                                    ? ColorApp.white
                                    : ColorApp.black,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setDate(DateTime.now());
                            },
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: BlocProvider.of<MatchesBloc>(context)
                                            .date ==
                                        reformatDate(DateTime.now())
                                    ? ColorApp.yellow
                                    : ColorApp.white,
                                border: Border.all(
                                    color: ColorApp.borderGray, width: 1),
                              ),
                              child: Center(
                                  child: MainText(
                                text: LocaleKeys.today.tr(),
                                font: 12,
                                family: TextFontApp.mediumFont,
                                color: BlocProvider.of<MatchesBloc>(context)
                                            .date ==
                                        reformatDate(DateTime.now())
                                    ? ColorApp.white
                                    : ColorApp.black,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setDate(DateTime.now().add((Duration(days: 1))));
                            },
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: BlocProvider.of<MatchesBloc>(context)
                                            .date ==
                                        reformatDate(DateTime.now()
                                            .add((Duration(days: 1))))
                                    ? ColorApp.yellow
                                    : ColorApp.white,
                                border: Border.all(
                                    color: ColorApp.borderGray, width: 1),
                              ),
                              child: Center(
                                  child: MainText(
                                text: LocaleKeys.tomorrow.tr(),
                                font: 12,
                                family: TextFontApp.mediumFont,
                                color: BlocProvider.of<MatchesBloc>(context)
                                            .date ==
                                        reformatDate(DateTime.now()
                                            .add((Duration(days: 1))))
                                    ? ColorApp.white
                                    : ColorApp.black,
                              )),
                            ),
                          ),
                        ),
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
                                title:result[index].season,
                                type:result[index].type ,
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
        ));
  }
}
