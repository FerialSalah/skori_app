import 'package:dartz/dartz.dart';
import 'package:skori/modules/teams/domain/entity/team_statistics_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../../../nav_bar/domain/entity/match_entity.dart';
import '../../../news/domain/entity/news_entity.dart';
import '../../../players/domain/entity/player_entity.dart';
import '../entity/team_entity.dart';

abstract class TeamsRepository{
  ///domain layer Repository Call Functions and return right and left
  /// right is the data return left is the failure


  Future<Either<Failure,List<TeamEntity>>> getTeams({required int page, String? teamName, String? tournamentId, String? countryId});
  Future<Either<Failure,List<TeamEntity>>> getFilterTeams({String? tournamentId});

  Future<Either<Failure,List<MatchEntity>>> getTeamMatches({required int id});
  Future<Either<Failure,TeamStatisticsEntity>> getTeamStatistics({required int id});
  Future<Either<Failure,List<NewsEntity>>> getTeamNews({required int id});
  Future<Either<Failure,List<PlayerEntity>>> getTeamPlayers({required int id});
}