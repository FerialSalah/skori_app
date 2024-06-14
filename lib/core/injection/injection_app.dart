import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:skori/core/cubit/gallery/league_gallery_cubit.dart';
import 'package:skori/core/cubit/gallery/match_gallery_cubit.dart';
import 'package:skori/core/cubit/gallery/player_gallery_cubit.dart';
import 'package:skori/core/cubit/gallery/team_gallery_cubit.dart';
import 'package:skori/core/cubit/gender_cubit.dart';
import 'package:skori/core/cubit/player_league/player_leagues_cubit.dart';
import 'package:skori/core/cubit/season/season_cubit.dart';
import 'package:skori/modules/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:skori/modules/authentication/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/data/datasource/leagues_datasource.dart';
import 'package:skori/modules/leagues_and_tabels/data/repository/leagues_repository_imp.dart';
import 'package:skori/modules/leagues_and_tabels/domain/repository/leagues_repository.dart';
import 'package:skori/modules/leagues_and_tabels/domain/usecase/leagues_usecase.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_discipline_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_performance_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_top_assists_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/league_top_scores_bloc.dart';
import 'package:skori/modules/leagues_and_tabels/presentation/bloc/leagues_bloc.dart';
import 'package:skori/modules/matches/data/datasource/matc_statistic_data_source.dart';
import 'package:skori/modules/matches/data/repository/match_statistics_repository_imp.dart';
import 'package:skori/modules/matches/domain/repository/match_statistics_repository.dart';
import 'package:skori/modules/matches/domain/usecase/match_statistics_usecase.dart';
import 'package:skori/modules/matches/presentation/bloc/match_statistics_bloc.dart';
import 'package:skori/modules/matches/presentation/bloc/previous_matches_bloc.dart';
import 'package:skori/modules/matches/presentation/bloc/recent_away_matches_bloc.dart';
import 'package:skori/modules/nav_bar/data/datasource/nav_bar_datasource.dart';
import 'package:skori/modules/nav_bar/data/repository/nav_bar_repository_imp.dart';
import 'package:skori/modules/nav_bar/domain/repository/nav_bar_repository.dart';
import 'package:skori/modules/nav_bar/domain/usecase/nav_bar_usecase.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/home_bloc.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/matches_bloc.dart';
import 'package:skori/modules/news/data/datasource/news_datasource.dart';
import 'package:skori/modules/news/data/repository/news_repository_imp.dart';
import 'package:skori/modules/news/domain/repository/news_repository.dart';
import 'package:skori/modules/news/domain/usecase/news_usecase.dart';
import 'package:skori/modules/news/presentation/bloc/news_bloc.dart';
import 'package:skori/modules/players/data/datasource/players_datasource.dart';
import 'package:skori/modules/players/data/repository/player_repository_imp.dart';
import 'package:skori/modules/players/domain/repository/player_repository.dart';
import 'package:skori/modules/players/domain/usecase/player_usecase.dart';
import 'package:skori/modules/players/presentation/bloc/history_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/player_info_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/player_statistics_bloc.dart';
import 'package:skori/modules/players/presentation/bloc/players_bloc.dart';
import 'package:skori/modules/profile/data/datasource/profile_datasource.dart';
import 'package:skori/modules/profile/data/repository/profile_repository_imp.dart';
import 'package:skori/modules/profile/domain/repository/profile_repository.dart';
import 'package:skori/modules/profile/domain/usecase/profile_usecase.dart';
import 'package:skori/modules/profile/presentation/bloc/delete_notification/delete_notification_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/favorites_list/player_favorites_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/favorites_list/team_favorites_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/player_follwing_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/notifications/notifications_bloc.dart';
import 'package:skori/modules/search/data/datasource/search_datasource.dart';
import 'package:skori/modules/search/data/repository/search_repository_imp.dart';
import 'package:skori/modules/search/domain/repository/search_repository.dart';
import 'package:skori/modules/search/domain/usecase/search_usecase.dart';
import 'package:skori/modules/teams/data/datasource/team_datasource.dart';
import 'package:skori/modules/teams/data/repository/team_repository_imp.dart';
import 'package:skori/modules/teams/domain/repository/team_repository.dart';
import 'package:skori/modules/teams/domain/usecase/team_usecase.dart';
import 'package:skori/modules/teams/presentation/bloc/team_bloc.dart';
import 'package:skori/modules/teams/presentation/bloc/team_news_bloc.dart';
import 'package:skori/modules/transfers/data/datasource/transfer_datasource.dart';
import 'package:skori/modules/transfers/data/repository/transfer_repository_imp.dart';
import 'package:skori/modules/transfers/domain/usecase/transfer_usecase.dart';
import 'package:skori/modules/transfers/presentaion/bloc/transfers_bloc.dart';
import '../../modules/authentication/data/datasource/auth_dataSource.dart';
import '../../modules/authentication/data/datasource/base_dataSoruce_auth.dart';
import '../../modules/authentication/data/repository/imp_repo_auth.dart';
import '../../modules/authentication/domain/repository/base_auth_repository.dart';
import '../../modules/authentication/domain/usecase/auth_usecase.dart';
import '../../modules/authentication/presentation/bloc/forget_password/forget_password_bloc.dart';
import '../../modules/authentication/presentation/bloc/sign_up/bloc.dart';
import '../../modules/authentication/presentation/bloc/social_cubit.dart';
import '../../modules/leagues_and_tabels/presentation/bloc/league_news_bloc.dart';
import '../../modules/leagues_and_tabels/presentation/bloc/table_bloc.dart';
import '../../modules/matches/presentation/bloc/recent_home_matches_bloc.dart';
import '../../modules/nav_bar/presentation/bloc/nav_bar_cubit.dart';
import '../../modules/news/presentation/bloc/add_comment_cubit.dart';
import '../../modules/news/presentation/bloc/comment_cubit.dart';
import '../../modules/news/presentation/bloc/exclusive_news_bloc.dart';
import '../../modules/news/presentation/bloc/highlight_news_bloc.dart';
import '../../modules/news/presentation/bloc/interview_news_bloc.dart';
import '../../modules/news/presentation/bloc/new_news_bloc.dart';
import '../../modules/news/presentation/bloc/news_details_bloc.dart';
import '../../modules/players/presentation/bloc/player_news_bloc.dart';
import '../../modules/profile/presentation/bloc/change_password/bloc.dart';
import '../../modules/profile/presentation/bloc/contact_us/bloc.dart';
import '../../modules/profile/presentation/bloc/delete_account/delete_account_cubit.dart';
import '../../modules/profile/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import '../../modules/profile/presentation/bloc/favorites_list/leagues_favourits_bloc.dart';
import '../../modules/profile/presentation/bloc/favorites_list/news_favorite_bloc.dart';
import '../../modules/profile/presentation/bloc/following_list/leagues_following_bloc.dart';
import '../../modules/profile/presentation/bloc/following_list/team_following_bloc.dart';
import '../../modules/profile/presentation/bloc/packages/my_packages_cubit.dart';
import '../../modules/profile/presentation/bloc/packages/packages_bloc.dart';
import '../../modules/profile/presentation/bloc/packages/payment_cubit.dart';
import '../../modules/profile/presentation/bloc/packages/subscribe_bloc.dart';
import '../../modules/search/presentation/bloc/search_bloc.dart';
import '../../modules/teams/presentation/bloc/team_matches_bloc.dart';
import '../../modules/teams/presentation/bloc/team_player_bloc.dart';
import '../../modules/teams/presentation/bloc/team_statistics_bloc.dart';
import '../../modules/transfers/domain/repository/transfer_repository.dart';
import '../cubit/availability_cubit.dart';
import '../cubit/country/country_cubit.dart';
import '../cubit/favorite_cubit.dart';
import '../cubit/follow_cubit.dart';
import '../cubit/season/player_season_cubit.dart';
import '../cubit/setting/setting_cubit.dart';
import '../validation/cubit/datePicker_cubit.dart';
import '../validation/cubit/validation_cubit.dart';
import '../validation/cubit/validation_shipment_info.dart';
import '../network/network_checker.dart';
import '../validation/cubit/cupertinoPicker_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
//Cubits - Blocs - View Models
  getIt.registerFactory(() => NavBarCubit());
  getIt.registerFactory(() => DatePickerCubit(null));
  getIt.registerFactory(() => ValidationCubit(false));
  getIt.registerFactory(() => ValidationShipmentInfo(false));
  getIt.registerFactory(() => CupertinoPickerCubit(null));
  getIt.registerFactory(() => FollowCubit(getIt()));
  getIt.registerFactory(() => FavoriteCubit(getIt()));
  getIt.registerFactory(() => SettingCubit());
  getIt.registerFactory(() => CountriesCubit());
  getIt.registerFactory(() => SeasonsCubit());
  getIt.registerFactory(() => PlayerSeasonsCubit(getIt()));
  getIt.registerFactory(() => PlayerLeaguesCubit());
  getIt.registerFactory(() => TeamGalleryCubit());
  getIt.registerFactory(() => LeagueGalleryCubit());
  getIt.registerFactory(() => PlayerGalleryCubit());
  getIt.registerFactory(() => MatchGalleryCubit());
  getIt.registerFactory(() => AddCommentCubit(getIt()));
  getIt.registerFactory(() => CommentCubit(getIt()));
  getIt.registerFactory(() => PackagesCubit(getIt()));
  getIt.registerFactory(() => MyPackagesCubit(getIt()));
  getIt.registerFactory(() => SubscribeCubit(getIt()));
  getIt.registerFactory(() => PaymentCubit(getIt()));
  getIt.registerFactory(() => DeleteAccountCubit(getIt()));
  getIt.registerFactory(() => AvailabilityCubit());
  getIt.registerFactory(() => SocialLoginCubit(getIt()));

  /// AUTH
  getIt.registerFactory(() => LoginBloc(getIt()));
  getIt.registerFactory(() => ForgetPasswordBloc(getIt()));
  getIt.registerFactory(() => ResetPasswordBloc(getIt()));
  getIt.registerFactory(() => SignUpBloc(getIt()));
  getIt.registerFactory(() => GenderCubit());


  /// other
  getIt.registerFactory(() => TeamsBloc(getIt()));
  getIt.registerFactory(() => HomeBloc(getIt()));
  getIt.registerFactory(() => NewsBloc(getIt()));
  getIt.registerFactory(() => NewsDetailsBloc(getIt()));
  getIt.registerFactory(() => NewNewsBloc(getIt()));
  getIt.registerFactory(() => ExclusiveNewsBloc(getIt()));
  getIt.registerFactory(() => HighlightNewsBloc(getIt()));
  getIt.registerFactory(() => InterviewNewsBloc(getIt()));
  getIt.registerFactory(() => PlayersBloc(getIt()));
  getIt.registerFactory(() => MatchesBloc(getIt()));
  getIt.registerFactory(() => LeaguesBloc(getIt()));
  getIt.registerFactory(() => TableBloc(getIt()));
  getIt.registerFactory(() => FollowingPlayersBloc(getIt()));
  getIt.registerFactory(() => FollowingTeamsBloc(getIt()));
  getIt.registerFactory(() => FollowingLeaguesBloc(getIt()));
  getIt.registerFactory(() => FavoritesPlayersBloc(getIt()));
  getIt.registerFactory(() => FavoritesTeamsBloc(getIt()));
  getIt.registerFactory(() => FavoritesLeaguesBloc(getIt()));
  getIt.registerFactory(() => FavoritesNewsBloc(getIt()));
  getIt.registerFactory(() => NotificationsBloc(getIt()));
  getIt.registerFactory(() => EditProfileBloc(getIt()));
  getIt.registerFactory(() => ChangePasswordBloc(getIt()));
  getIt.registerFactory(() => ContactUsBloc(getIt()));
  getIt.registerFactory(() => DeleteNotificationBloc(getIt()));
  getIt.registerFactory(() => PlayerInfoBloc(getIt()));
  getIt.registerFactory(() => PlayerStatisticsBloc(getIt()));
  getIt.registerFactory(() => PlayerHistoryBloc(getIt()));
  getIt.registerFactory(() => PlayerNewsBloc(getIt()));
  getIt.registerFactory(() => TeamMatchesBloc(getIt()));
  getIt.registerFactory(() => TeamStatisticsBloc(getIt()));
  getIt.registerFactory(() => TeamNewsBloc(getIt()));
  getIt.registerFactory(() => TeamPlayersBloc(getIt()));
  getIt.registerFactory(() => SearchBloc(getIt()));
  getIt.registerFactory(() => MatchStatisticsBloc(getIt()));
  getIt.registerFactory(() => RecentHomeMatchesBloc(getIt()));
  getIt.registerFactory(() => RecentAwayMatchesBloc(getIt()));
  getIt.registerFactory(() => PreviousMatchesBloc(getIt()));
  getIt.registerFactory(() => TransfersBloc(getIt()));
  getIt.registerFactory(() => LeagueNewsBloc(getIt()));
  getIt.registerFactory(() => LeagueTopScoresBloc(getIt()));
  getIt.registerFactory(() => LeagueTopAssistsBloc(getIt()));
  getIt.registerFactory(() => LeagueDisciplineBloc(getIt()));
  getIt.registerFactory(() => LeaguePerformanceBloc(getIt()));






//============================================================================//

/// Repositories

  getIt.registerLazySingleton<BaseRepositoryAuth>(
          () => ImpRepositoryAuth(getIt(), getIt()));
  getIt.registerLazySingleton<TeamsRepository>(
          () => TeamsRepositoryImp(getIt(), getIt()));
  getIt.registerLazySingleton<NewsRepository>(
          () => NewsRepositoryImp(getIt(), getIt()));
  getIt.registerLazySingleton<PlayersRepository>(
          () => PlayersRepositoryImp(getIt(), getIt()));
  getIt.registerLazySingleton<NavBarRepository>(
          () => NavBarRepositoryImp(getIt(), getIt()));
  //
  getIt.registerLazySingleton<LeaguesRepository>(
          () => LeaguesRepositoryImp(getIt(), getIt()));


  getIt.registerLazySingleton<ProfileRepository>(
          () => ProfileRepositoryImp(getIt(), getIt()));
  getIt.registerLazySingleton<SearchRepository>(
          () => SearchRepositoryImp(getIt(), getIt()));
  getIt.registerLazySingleton<MatchStatisticsRepository>(
          () => MatchStatisticsRepositoryImp(getIt(), getIt()));
  getIt.registerLazySingleton<TransferRepository>(
          () => TransfersRepositoryImp(getIt(), getIt()));

//============================================================================//
///UseCases
//
  getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCase(getIt()));
  getIt.registerLazySingleton<TeamsUseCase>(() => TeamsUseCase(getIt()));
  getIt.registerLazySingleton<NewsUseCase>(() => NewsUseCase(getIt()));
  getIt.registerLazySingleton<PlayersUseCase>(() => PlayersUseCase(getIt()));
  getIt.registerLazySingleton<NavBarUseCase>(() => NavBarUseCase(getIt()));
  getIt.registerLazySingleton<LeaguesUseCase>(() => LeaguesUseCase(getIt()));
  getIt.registerLazySingleton<ProfileUseCase>(() => ProfileUseCase(getIt()));
  getIt.registerLazySingleton<SearchUseCase>(() => SearchUseCase(getIt()));
  getIt.registerLazySingleton<MatchStatisticsUseCase>(() => MatchStatisticsUseCase(getIt()));
  getIt.registerLazySingleton<TransfersUseCase>(() => TransfersUseCase(getIt()));



//============================================================================//
///DataSource
//   getIt.registerLazySingleton<MapDataSource>(() => MapDataSource());
  getIt.registerLazySingleton<BaseDataSourceAuth>(
          () => AuthDataSource()); //Races DataSource
//
  getIt.registerLazySingleton<BaseTeamsDataSource>(
          () => TeamsDataSource());

  getIt.registerLazySingleton<BaseNewsDataSource>(
          () => NewsDataSource());

  getIt.registerLazySingleton<BasePlayersDataSource>(
          () => PlayersDataSource());
//
  getIt.registerLazySingleton<BaseNavBarDataSource>(
          () => NavBarDataSource());
//
  getIt.registerLazySingleton<BaseLeaguesDataSource>(
          () => LeaguesDataSource());

  getIt.registerLazySingleton<BaseProfileDataSource>(
          () => ProfileDataSource());

  getIt.registerLazySingleton<BaseSearchDataSource>(
          () => SearchDataSource());
  getIt.registerLazySingleton<BaseMatchStatisticsDataSource>(
          () => MatchStatisticsDataSource());
  getIt.registerLazySingleton<BaseTransfersDataSource>(
          () => TransfersDatasource());

//============================================================================//
//Core
  getIt.registerLazySingleton<NetworkChecker>(
          () => NetworkChecker(internetConnectionChecker: getIt()));

//============================================================================//
//Extra Injection
  // final sharedPreferences = await SharedPreferences.getInstance();
  // getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
