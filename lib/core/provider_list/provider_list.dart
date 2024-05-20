import 'dart:core';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/cubit/player_league/player_leagues_cubit.dart';
import 'package:skori/core/cubit/season/season_cubit.dart';
import 'package:skori/modules/matches/presentation/bloc/match_statistics_bloc.dart';
import 'package:skori/modules/matches/presentation/bloc/recent_away_matches_bloc.dart';
import 'package:skori/modules/matches/presentation/bloc/recent_home_matches_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/history_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/player_info_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/player_statistics_bloc.dart';
import 'package:skori/modules/players/presentation/widgets/player_statistics.dart';
import 'package:skori/modules/teams/presentation/bloc/team_player_bloc.dart';
import '../../modules/authentication/presentation/bloc/forget_password/forget_password_bloc.dart';
import '../../modules/authentication/presentation/bloc/login/login_bloc.dart';
import '../../modules/authentication/presentation/bloc/reset_password/reset_password_bloc.dart';
import '../../modules/authentication/presentation/bloc/sign_up/bloc.dart';
import '../../modules/authentication/presentation/bloc/social_cubit.dart';
import '../../modules/leagues_and_tabels/presentation/bloc/leagues_bloc.dart';
import '../../modules/leagues_and_tabels/presentation/bloc/leagues_event.dart';
import '../../modules/matches/presentation/bloc/match_statistics_event.dart';
import '../../modules/matches/presentation/bloc/previous_matches_bloc.dart';
import '../../modules/nav_bar/presentation/bloc/home_bloc.dart';
import '../../modules/nav_bar/presentation/bloc/home_event.dart';
import '../../modules/nav_bar/presentation/bloc/matches_bloc.dart';
import '../../modules/nav_bar/presentation/bloc/matches_event.dart';
import '../../modules/nav_bar/presentation/bloc/nav_bar_cubit.dart';
import '../../modules/news/presentation/bloc/add_comment_cubit.dart';
import '../../modules/news/presentation/bloc/comment_cubit.dart';
import '../../modules/news/presentation/bloc/exclusive_news_bloc.dart';
import '../../modules/news/presentation/bloc/highlight_news_bloc.dart';
import '../../modules/news/presentation/bloc/interview_news_bloc.dart';
import '../../modules/news/presentation/bloc/new_news_bloc.dart';
import '../../modules/news/presentation/bloc/news_bloc.dart';
import '../../modules/news/presentation/bloc/news_details_bloc.dart';
import '../../modules/news/presentation/bloc/news_event.dart';
import '../../modules/players/presentation/bloc/player_news_bloc.dart';
import '../../modules/players/presentation/bloc/players_bloc.dart';
import '../../modules/players/presentation/bloc/players_event.dart';
import '../../modules/profile/presentation/bloc/change_password/bloc.dart';
import '../../modules/profile/presentation/bloc/contact_us/bloc.dart';
import '../../modules/profile/presentation/bloc/delete_account/delete_account_cubit.dart';
import '../../modules/profile/presentation/bloc/edit_profile/edit_profile_bloc.dart';
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
import '../../modules/profile/presentation/bloc/packages/payment_cubit.dart';
import '../../modules/profile/presentation/bloc/packages/subscribe_bloc.dart';
import '../../modules/search/presentation/bloc/search_bloc.dart';
import '../../modules/teams/presentation/bloc/team_bloc.dart';
import '../../modules/teams/presentation/bloc/team_event.dart';
import '../cubit/availability_cubit.dart';
import '../cubit/country/country_cubit.dart';
import '../cubit/favorite_cubit.dart';
import '../cubit/follow_cubit.dart';
import '../cubit/gender_cubit.dart';
import '../cubit/season/player_season_cubit.dart';
import '../cubit/setting/setting_cubit.dart';
import '../injection/injection_app.dart' as di;



class BlocProvidersList {

  static List<BlocProvider> providersList = [
    BlocProvider<NavBarCubit>(create: (_) => di.getIt<NavBarCubit>()),
    BlocProvider<LoginBloc>(create: (_) => di.getIt<LoginBloc>()),
    BlocProvider<ForgetPasswordBloc>(create: (_) => di.getIt<ForgetPasswordBloc>()),
    BlocProvider<ResetPasswordBloc>(create: (_) => di.getIt<ResetPasswordBloc>()),
    BlocProvider<SignUpBloc>(create: (_) => di.getIt<SignUpBloc>()),
    BlocProvider<GenderCubit>(create: (_) => di.getIt<GenderCubit>()),
    BlocProvider<FollowCubit>(create: (_) => di.getIt<FollowCubit>()),
    BlocProvider<FavoriteCubit>(create: (_) => di.getIt<FavoriteCubit>()),
    BlocProvider<SettingCubit>(create: (_) => di.getIt<SettingCubit>()..getSetting()),
    BlocProvider<AvailabilityCubit>(create: (_) => di.getIt<AvailabilityCubit>()..getAvailability()),
    BlocProvider<CountriesCubit>(create: (_) => di.getIt<CountriesCubit>()..getCountries(),lazy: false,),
    BlocProvider<SeasonsCubit>(create: (_) => di.getIt<SeasonsCubit>()..getSeasons(),lazy: false,),
    BlocProvider<PlayerSeasonsCubit>(create: (_) => di.getIt<PlayerSeasonsCubit>()),
    BlocProvider<PlayerLeaguesCubit>(create: (_) => di.getIt<PlayerLeaguesCubit>()),

    BlocProvider<TeamsBloc>(create: (_) => di.getIt<TeamsBloc>()..add(GetTeamsData())),
    BlocProvider<TeamsBloc>(create: (_) => di.getIt<TeamsBloc>()..add(GetFilterTeamsData())),

    BlocProvider<HomeBloc>(create: (_) => di.getIt<HomeBloc>()..add(GetHomeData())),
    BlocProvider<NewsBloc>(create: (_) => di.getIt<NewsBloc>()..add(GetNewsData())),
    BlocProvider<NewsDetailsBloc>(create: (_) => di.getIt<NewsDetailsBloc>()),
    BlocProvider<NewNewsBloc>(create: (_) => di.getIt<NewNewsBloc>()..add(GetNewNewsData())),
    BlocProvider<ExclusiveNewsBloc>(create: (_) => di.getIt<ExclusiveNewsBloc>()..add(GetExclusiveNewsData())),
    BlocProvider<HighlightNewsBloc>(create: (_) => di.getIt<HighlightNewsBloc>()..add(GetHighlightNewsData())),
    BlocProvider<InterviewNewsBloc>(create: (_) => di.getIt<InterviewNewsBloc>()..add(GetInterviewNewsData())),
    BlocProvider<PlayersBloc>(create: (_) => di.getIt<PlayersBloc>()..add(GetPlayersData())),
    BlocProvider<MatchesBloc>(create: (_) => di.getIt<MatchesBloc>()..add(GetMatchesData())),
    BlocProvider<LeaguesBloc>(create: (_) => di.getIt<LeaguesBloc>()..add(GetLeaguesData())),
    BlocProvider<FollowingPlayersBloc>(create: (_) => di.getIt<FollowingPlayersBloc>()..add(GetFollowingPlayersData())),
    BlocProvider<FollowingTeamsBloc>(create: (_) => di.getIt<FollowingTeamsBloc>()..add(GetFollowingTeamsData())),
    BlocProvider<FollowingLeaguesBloc>(create: (_) => di.getIt<FollowingLeaguesBloc>()..add(GetFollowingLeaguesData())),
    BlocProvider<FavoritesPlayersBloc>(create: (_) => di.getIt<FavoritesPlayersBloc>()..add(GetFavoritesPlayersData())),
    BlocProvider<FavoritesTeamsBloc>(create: (_) => di.getIt<FavoritesTeamsBloc>()..add(GetFavoritesTeamsData())),
    BlocProvider<FavoritesLeaguesBloc>(create: (_) => di.getIt<FavoritesLeaguesBloc>()..add(GetFavoritesLeaguesData())),
    BlocProvider<NotificationsBloc>(create: (_) => di.getIt<NotificationsBloc>()..add(GetNotificationsData())),
    BlocProvider<EditProfileBloc>(create: (_) => di.getIt<EditProfileBloc>()),
    BlocProvider<ChangePasswordBloc>(create: (_) => di.getIt<ChangePasswordBloc>()),
    BlocProvider<ContactUsBloc>(create: (_) => di.getIt<ContactUsBloc>()),
    BlocProvider<AddCommentCubit>(create: (_) => di.getIt<AddCommentCubit>()),
    BlocProvider<CommentCubit>(create: (_) => di.getIt<CommentCubit>()),
    BlocProvider<SearchBloc>(create: (_) => di.getIt<SearchBloc>()),
    BlocProvider<PackagesCubit>(create: (_) => di.getIt<PackagesCubit>()..getPackages()),
    BlocProvider<MyPackagesCubit>(create: (_) => di.getIt<MyPackagesCubit>()..getMyPackages()),
    BlocProvider<SubscribeCubit>(create: (_) => di.getIt<SubscribeCubit>()),
    BlocProvider<PaymentCubit>(create: (_) => di.getIt<PaymentCubit>()),
    BlocProvider<DeleteAccountCubit>(create: (_) => di.getIt<DeleteAccountCubit>()),
    BlocProvider<SocialLoginCubit>(create: (_) => di.getIt<SocialLoginCubit>()),
    BlocProvider<MatchStatisticsBloc>(create: (_) => di.getIt<MatchStatisticsBloc>()),
    BlocProvider<RecentHomeMatchesBloc>(create: (_) => di.getIt<RecentHomeMatchesBloc>()),
    BlocProvider<RecentAwayMatchesBloc>(create: (_) => di.getIt<RecentAwayMatchesBloc>()),
    BlocProvider<PreviousMatchesBloc>(create: (_) => di.getIt<PreviousMatchesBloc>()),
    BlocProvider<PlayerInfoBloc>(create: (_) => di.getIt<PlayerInfoBloc>()),
    BlocProvider<PlayerStatisticsBloc>(create: (_) => di.getIt<PlayerStatisticsBloc>()),
    BlocProvider<PlayerNewsBloc>(create: (_) => di.getIt<PlayerNewsBloc>()),
    BlocProvider<PlayerHistoryBloc>(create: (_) => di.getIt<PlayerHistoryBloc>()),








  ];

}