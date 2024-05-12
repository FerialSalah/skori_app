
import 'package:dartz/dartz.dart';
import 'package:skori/modules/matches/data/datasource/matc_statistic_data_source.dart';
import 'package:skori/modules/matches/domain/entity/statistics_entity.dart';
import 'package:skori/modules/matches/domain/repository/match_statistics_repository.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';


class MatchStatisticsRepositoryImp implements MatchStatisticsRepository{
  final BaseMatchStatisticsDataSource matchStatisticsDataSource;
  final NetworkChecker networkChecker;
  MatchStatisticsRepositoryImp(this.matchStatisticsDataSource, this.networkChecker);




  @override
  Future<Either<Failure, StatisticsEntity>> getMatchStatistics({required int matchId})async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await matchStatisticsDataSource.getMatchStatistics(matchId: matchId);
        return Right(result);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<MatchEntity>>> getPreviousMatches({required int homeTeamId, required int awayTeamId, required int matchId}) async{
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await matchStatisticsDataSource.getPreviousMatches(matchId: matchId, homeTeamId: homeTeamId,awayTeamId: awayTeamId);
        print("------------matches previous-------:${result.data}");
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<MatchEntity>>> getRecentMatches({required int teamId, required int matchId}) async{
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await matchStatisticsDataSource.getRecentMatches(TeamId: teamId, matchId: matchId);
        print("-------------matches recent:${result}");
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }




}