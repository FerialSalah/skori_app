import 'package:dartz/dartz.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/players/domain/entity/player_new_statistics_entity.dart';
import 'package:skori/modules/players/domain/entity/player_statistics_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';
import '../../domain/entity/player_history_entity.dart';
import '../../domain/repository/player_repository.dart';
import '../datasource/players_datasource.dart';

class PlayersRepositoryImp implements PlayersRepository {
  final BasePlayersDataSource basePlayersDataSource;
  final NetworkChecker networkChecker;
  PlayersRepositoryImp(this.basePlayersDataSource, this.networkChecker);


  @override
  Future<Either<Failure, List<PlayerEntity>>> getPlayers({required int page,String? teamId,String? countryId,String? playerName}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await basePlayersDataSource.getPlayers(page: page,
        teamId: teamId,countryId: countryId,playerName: playerName);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, PlayerEntity>> getPlayerInfo({required int id})async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await basePlayersDataSource.getPlayerInfo(id: id);
        return Right(result);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }


  @override
  Future<Either<Failure, PlayerStatisticsEntity>> getPlayerStatistics({required int id})async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await basePlayersDataSource.getPlayerStatistics(id: id);
        return Right(result.playerStatistics);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<PlayerHistoryEntity>>> getPlayerHistory({required int id})async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await basePlayersDataSource.getPlayerHistory(id: id,);
        return Right(result.playerHistoryData);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getPlayerNews({required int id})async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await basePlayersDataSource.getPlayerNews(id: id,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, PlayerNewStatisticsEntity>> getPlayerNewStatistics({required int id,String? tournamentId,String? seasonId}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        PlayerNewStatisticsEntity result = await basePlayersDataSource.getPlayerNewStatistics(id: id,tournamentId: tournamentId,seasonId: seasonId);
       // print("new statistics:  ${result.playerPerformance!}");
        return Right(result);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }
  }




