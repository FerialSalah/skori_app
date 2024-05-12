import 'package:dartz/dartz.dart';
import 'package:skori/modules/players/domain/entity/player_new_statistics_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../../../news/domain/entity/news_entity.dart';
import '../entity/player_entity.dart';
import '../entity/player_history_entity.dart';
import '../entity/player_statistics_entity.dart';

abstract class PlayersRepository{
  ///domain layer Repository Call Functions and return right and left
  /// right is the data return left is the failure
  Future<Either<Failure,List<PlayerEntity>>> getPlayers({required int page,String? teamId,String? countryId,String? playerName});
  Future<Either<Failure,PlayerEntity>> getPlayerInfo({required int id});
  Future<Either<Failure,PlayerStatisticsEntity>> getPlayerStatistics({required int id});
  Future<Either<Failure,List<PlayerHistoryEntity>>> getPlayerHistory({required int id});
  Future<Either<Failure,List<NewsEntity>>> getPlayerNews({required int id});
  Future<Either<Failure,PlayerNewStatisticsEntity>> getPlayerNewStatistics({required int id,String? tournamentId,String? seasonId});

}