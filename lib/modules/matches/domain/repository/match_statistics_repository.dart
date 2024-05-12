import 'package:dartz/dartz.dart';
import 'package:skori/modules/matches/domain/entity/statistics_entity.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';

import '../../../../core/errors/faliure.dart';

abstract class MatchStatisticsRepository{
  ///domain layer Repository Call Functions and return right and left right is the data return left is the failure
  ///
  //
  Future<Either<Failure,StatisticsEntity>> getMatchStatistics({required int matchId});
  Future<Either<Failure,List<MatchEntity>>> getPreviousMatches({required int homeTeamId, required int awayTeamId, required int matchId});
  Future<Either<Failure,List<MatchEntity>>> getRecentMatches({required int teamId, required int matchId});


}