import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/app_storage/app_storage.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/core/state/base_state.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/search/presentation/widgets/search_leagues.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/customTextFeild.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../../../core/widgets/should_sign_up.dart';
import '../../../Search/presentation/Widgets/search_team.dart';
import '../Widgets/search_news.dart';
import '../Widgets/search_players.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_event.dart';
import '../widgets/serach_filter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController key = new TextEditingController();
  // String type = "all";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  RouteManager.pop();
                },
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: CustomTextField(
                  height: 40.h,
                  dIcon: AppIcons.search,
                  withBorder: false,
                  controller: key,
                  fillColor: ColorApp.lightGray,
                  hint: LocaleKeys.search.tr(),
                  onChange: (v) {
                    if (v!.isNotEmpty && v.length > 1) {
                      BlocProvider.of<SearchBloc>(context).key = v;
                      BlocProvider.of<SearchBloc>(context)..add(GetSearch());
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               LocaleKeys.searchType.tr(),
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (builder) {
                        return SearchFilter();
                      });
                },
                child: BlocBuilder<SearchBloc, BaseState>(
                  builder: (context, state) {
                    return Container(
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Color(0xffE01942).withOpacity(.2)),
                      padding: EdgeInsets.only(left: 6, right: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            BlocProvider.of<SearchBloc>(context).type.tr(),
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 20,
                            color: Colors.red,
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
          BlocBuilder<SearchBloc, BaseState>(
            builder: (context, state) {
              final results = BlocProvider.of<SearchBloc>(context).searchEntity;
              if (state is SuccessState) {
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    children: [
                      results!.newResults.isEmpty
                          ? SizedBox()
                          : MainText(
                              text: "${LocaleKeys.news.tr()}(${results.newResults.length})",
                              family: TextFontApp.extraBoldFont,
                              font: 14,
                            ),
                      results.newResults.isEmpty
                          ? SizedBox()
                          : SearchNews(
                              news: results.newResults,
                            ),
                      results.teamResults.isEmpty
                          ? SizedBox()
                          : MainText(
                              text: "${LocaleKeys.teams.tr()}(${results.teamResults.length})",
                              family: TextFontApp.extraBoldFont,
                              font: 14,
                            ),
                      results.teamResults.isEmpty
                          ? SizedBox()
                          : SearchTeams(
                              teams: results.teamResults,
                            ),
                      results.playerResults.isEmpty
                          ? SizedBox()
                          : MainText(
                              text: "${LocaleKeys.players.tr()}(${results.playerResults.length})",
                              family: TextFontApp.extraBoldFont,
                              font: 14,
                            ),
                      results.playerResults.isEmpty
                          ? SizedBox()
                          : SearchPlayers(
                              players: results.playerResults,
                            ),
                      results.leaguesResults.isEmpty
                          ? SizedBox()
                          : MainText(
                              text: "${LocaleKeys.leagues.tr()}(${results.leaguesResults.length})",
                              family: TextFontApp.extraBoldFont,
                              font: 14,
                            ),
                      results.leaguesResults.isEmpty
                          ? SizedBox()
                          : SearchLeagues(
                              leagues: results.leaguesResults,
                            ),
                    ],
                  ),
                );
              } else if (state is LoadingState) {
                return Expanded(child: ShimmerWidget());
              } else if (state is OfflineState) {
                return OfflinePage();
              } else {
                return Text(LocaleKeys.noResult.tr());
              }
            },
          )
        ],
      ),
    ));
  }
}
