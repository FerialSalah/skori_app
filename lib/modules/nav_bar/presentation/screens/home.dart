import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/core/widgets/customTextFeild.dart';
import 'package:skori/core/widgets/loader.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/home_bloc.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../profile/presentation/screens/notifications.dart';
import '../../../search/presentation/screens/search_screen.dart';
import '../widgets/home/follow_players.dart';
import '../widgets/home/follow_teams.dart';
import '../widgets/home/latest_news.dart';
import '../widgets/home/leagues.dart';
import '../widgets/home/live_matches_list.dart';
import '../widgets/home/live_matches_slider.dart';
import '../widgets/home/trending_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    // alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        AppImages.logo,
                        height: 32.h,
                        width: 105.w,
                      ),
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 20.0.h,
                        child: MainText(
                          text: LocaleKeys.beta.tr(),
                          font: 14,
                          family: TextFontApp.mediumFont,
                          color: ColorApp.yellow,
                        ), //CircularAvatar
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      RouteManager.navigateTo(NotificationsScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 9.5.w, vertical: 9.h),
                      color: ColorApp.red,
                      child: Image.asset(
                        AppIcons.notifications,
                        height: 21.h,
                        width: 20.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(
              hor: 16.w,
              onTap: () {
                RouteManager.navigateTo(SearchScreen());
              },
              height: 40.h,
              dIcon: AppIcons.search,
              withBorder: false,
              read: true,
              fillColor: ColorApp.lightGray,
              hint: LocaleKeys.search.tr(),
            ),
            BlocBuilder<HomeBloc, BaseState>(
              builder: (context, state) {
                final result = BlocProvider.of<HomeBloc>(context);
                if (state is LoadingState) {
                  return ColorLoader();
                } else if (state is SuccessState) {
                  print("matches: ${state.data.liveMatches}");
                  return Column(
                    children: [
                      LiveMatchesSlider(
                        matches: state.data.liveMatches,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      LatestNews(
                        news: state.data.latestNews,
                      ),
                      LiveMatchesList(matches: state.data.liveMatches),
                      TrendingNews(news: state.data.trendingNews),
                      FollowTeams(
                        teams: state.data.teams,
                      ),
                      PopularLeagues(
                        leagues: state.data.tournaments,
                      ),
                      FollowPlayers(
                        players: state.data.players,
                      ),
                    ],
                  );
                } else if (state is OfflineState) {
                  return Padding(
                      padding: EdgeInsets.only(top: 200.h),
                      child: OfflinePage());
                } else {
                  return Text("Server error");
                }
              },
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
