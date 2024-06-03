
import 'package:dartz/dartz.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/profile/domain/entity/notification_entity.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../../../leagues_and_tabels/domain/entity/leagues_entity.dart';
import '../../../players/domain/entity/player_entity.dart';

abstract class ProfileRepository{
  ///domain layer Repository Call Functions and return right and left
  /// right is the data return left is the failure


  Future<Either<Failure,Unit>> editProfile({required String firstName,required String lastName,required String email ,
    required String phone, required String gender,});
  Future<Either<Failure,Unit>> changePassword({required String oldPassword,required String newPassword,required String newPasswordConfirm});
  Future<Either<Failure,List<PlayerEntity>>> getFollowingPlayers(int page);
  Future<Either<Failure,List<TeamEntity>>> getFollowingTeams(int page);
  Future<Either<Failure,List<LeagueEntity>>> getFollowingLeagues(int page);
  Future<Either<Failure,List<TeamEntity>>> getFavoritesTeams(int page);
  Future<Either<Failure,List<PlayerEntity>>> getFavoritesPlayers(int page);
  Future<Either<Failure,List<LeagueEntity>>> getFavoritesLeagues(int page);
  Future<Either<Failure,List<NewsEntity>>> getFavoritesNews(int page);

  Future<Either<Failure,List<NotificationEntity>>> getNotifications();
  Future<Either<Failure,Unit>> contactUs({required String name,required String email,required String message});


}