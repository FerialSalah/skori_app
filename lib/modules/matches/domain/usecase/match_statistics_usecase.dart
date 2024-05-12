
import 'package:dartz/dartz.dart';
import 'package:skori/modules/matches/domain/entity/statistics_entity.dart';
import 'package:skori/modules/matches/domain/repository/match_statistics_repository.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';
import '../../../../core/errors/faliure.dart';


class MatchStatisticsUseCase{
  final  MatchStatisticsRepository matchStatisticsRepository;

  MatchStatisticsUseCase(this.matchStatisticsRepository);

  Future<Either<Failure,StatisticsEntity>> getMatchStatistics({required int matchId})async{
    return await matchStatisticsRepository.getMatchStatistics(matchId: matchId);
  }

  Future<Either<Failure,List<MatchEntity>>> getPreviousMatches({required int homeTeamId, required int awayTeamId, required int matchId })async {
    return await matchStatisticsRepository.getPreviousMatches(
        homeTeamId: homeTeamId, awayTeamId: awayTeamId, matchId: matchId);
  }
  Future<Either<Failure,List<MatchEntity>>> getRecentMatches({required int teamId, required int matchId })async {
    return await matchStatisticsRepository.getRecentMatches(
        teamId: teamId, matchId: matchId);
  }

  }

