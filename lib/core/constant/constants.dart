import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/routes/navigator_push.dart';
import '';
import 'package:skori/core/injection/injection_app.dart' as di;

import '../../modules/leagues_and_tabels/presentation/bloc/leagues_bloc.dart';
import '../../modules/leagues_and_tabels/presentation/bloc/leagues_event.dart';
import '../../modules/nav_bar/presentation/bloc/home_bloc.dart';
import '../../modules/nav_bar/presentation/bloc/home_event.dart';
import '../../modules/nav_bar/presentation/bloc/matches_bloc.dart';
import '../../modules/nav_bar/presentation/bloc/matches_event.dart';
import '../../modules/news/presentation/bloc/news_bloc.dart';
import '../../modules/news/presentation/bloc/news_event.dart';
import '../../modules/players/presentation/bloc/players_bloc.dart';
import '../../modules/players/presentation/bloc/players_event.dart';
import '../../modules/profile/presentation/bloc/favorites_list/favorites_event.dart';
import '../../modules/profile/presentation/bloc/favorites_list/leagues_favourits_bloc.dart';
import '../../modules/profile/presentation/bloc/favorites_list/player_favorites_bloc.dart';
import '../../modules/profile/presentation/bloc/favorites_list/team_favorites_bloc.dart';
import '../../modules/profile/presentation/bloc/following_list/following_event.dart';
import '../../modules/profile/presentation/bloc/following_list/leagues_following_bloc.dart';
import '../../modules/profile/presentation/bloc/following_list/player_follwing_bloc.dart';
import '../../modules/profile/presentation/bloc/following_list/team_following_bloc.dart';
import '../../modules/profile/presentation/bloc/notifications/notifications_bloc.dart';
import '../../modules/profile/presentation/bloc/notifications/notifications_event.dart';
import '../../modules/profile/presentation/bloc/packages/my_packages_cubit.dart';
import '../../modules/profile/presentation/bloc/packages/packages_bloc.dart';
import '../../modules/teams/presentation/bloc/team_bloc.dart';
import '../../modules/teams/presentation/bloc/team_event.dart';
import '../cubit/country/country_cubit.dart';
import '../cubit/setting/setting_cubit.dart';


String getIcon(String imageName) => 'assets/icon/$imageName.png';
String getAsset(String imageName) => 'assets/images/$imageName.png';
String getLottie(String lottieName) => 'assets/lottie/$lottieName.json';

bool isEn = RouteManager.currentContext.locale.languageCode == 'en';


void closeKeyboard ()=> FocusManager.instance.primaryFocus?.unfocus();

late  double theHeight =MediaQuery.of(RouteManager.currentContext).size.height;
late double theWidth =MediaQuery.of(RouteManager.currentContext).size.width;

double sizeFromHeight(double fraction,
    {bool removeAppBarSize = true}) {
  MediaQueryData mediaQuery = MediaQuery.of(RouteManager.currentContext);
  fraction = (removeAppBarSize
      ? (mediaQuery.size.height -
      AppBar().preferredSize.height -
      mediaQuery.padding.top)
      : mediaQuery.size.height) /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(double fraction) {
  fraction = MediaQuery.of(RouteManager.currentContext).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}




String reformatDate(DateTime? value){
  if(value == null) return '';
  final reformatted = value.year.toString() + '-' + value.month.toString().padLeft(2,'0') + '-' + value.day.toString().padLeft(2,'0');
  return reformatted;
}

void recallData(){
  BlocProvider.of<SettingCubit>(RouteManager.currentContext).getSetting();
  BlocProvider.of<CountriesCubit>(RouteManager.currentContext).getCountries();
  BlocProvider.of<TeamsBloc>(RouteManager.currentContext).add(GetTeamsData());
  BlocProvider.of<HomeBloc>(RouteManager.currentContext).add(GetHomeData());
  BlocProvider.of<NewsBloc>(RouteManager.currentContext).add(GetNewsData());
  BlocProvider.of<PlayersBloc>(RouteManager.currentContext).add(GetPlayersData());
  BlocProvider.of<MatchesBloc>(RouteManager.currentContext).add(GetMatchesData());
  BlocProvider.of<LeaguesBloc>(RouteManager.currentContext).add(GetLeaguesData());
  BlocProvider.of<FollowingPlayersBloc>(RouteManager.currentContext).add(GetFollowingPlayersData());
  BlocProvider.of<FollowingTeamsBloc>(RouteManager.currentContext).add(GetFollowingTeamsData());
  BlocProvider.of<FollowingLeaguesBloc>(RouteManager.currentContext).add(GetFollowingLeaguesData());
  BlocProvider.of<FavoritesPlayersBloc>(RouteManager.currentContext).add(GetFavoritesPlayersData());
  BlocProvider.of<FavoritesTeamsBloc>(RouteManager.currentContext).add(GetFavoritesTeamsData());
  BlocProvider.of<FavoritesLeaguesBloc>(RouteManager.currentContext).add(GetFavoritesLeaguesData());
  BlocProvider.of<NotificationsBloc>(RouteManager.currentContext).add(GetNotificationsData());
  BlocProvider.of<PackagesCubit>(RouteManager.currentContext).getPackages();
  BlocProvider.of<MyPackagesCubit>(RouteManager.currentContext).getMyPackages();
}