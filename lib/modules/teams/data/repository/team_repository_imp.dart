import 'package:dartz/dartz.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import 'package:skori/modules/teams/domain/entity/team_statistics_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';
import '../../../nav_bar/domain/entity/match_entity.dart';
import '../../../news/domain/entity/news_entity.dart';
import '../../domain/repository/team_repository.dart';
import '../datasource/team_datasource.dart';

class TeamsRepositoryImp implements TeamsRepository {
  final BaseTeamsDataSource baseTeamsDataSource;
  final NetworkChecker networkChecker;
  TeamsRepositoryImp(this.baseTeamsDataSource, this.networkChecker);
  @override
  Future<Either<Failure, List<TeamEntity>>> getTeams(
      {required int page, String? teamName, String? tournamentId, String? countryId}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseTeamsDataSource.getTeams(page: page,
        tournamentId: tournamentId,
          countryId: countryId,
          teamName: teamName
        );
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }
  @override
  Future<Either<Failure, List<TeamEntity>>> getFilterTeams(
      { String? tournamentId}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseTeamsDataSource.getFilterTeams(
            tournamentId: tournamentId,

        );
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<MatchEntity>>> getTeamMatches({required int id})async{
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseTeamsDataSource.getTeamMatches(id: id,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, TeamStatisticsEntity>> getTeamStatistics({required int id}) async{
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseTeamsDataSource.getTeamStatistics(id: id,);
        return Right(result.teamStatistics);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }


  @override
  Future<Either<Failure, List<NewsEntity>>> getTeamNews({required int id}) async{
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseTeamsDataSource.getTeamNews(id: id,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<PlayerEntity>>> getTeamPlayers({required int id}) async{
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseTeamsDataSource.getTeamPlayers(id: id,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }




}