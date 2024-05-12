import 'package:dartz/dartz.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/players/domain/entity/player_new_statistics_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/player_entity.dart';
import '../entity/player_history_entity.dart';
import '../entity/player_statistics_entity.dart';
import '../repository/player_repository.dart';

class PlayersUseCase{
  final  PlayersRepository playersRepository;

  PlayersUseCase(this.playersRepository);

  Future<Either<Failure,List<PlayerEntity>>> getPlayers({required int page,String? teamId,String? countryId,String? playerName})async{
    return await playersRepository.getPlayers(page:page,teamId: teamId,countryId: countryId,playerName: playerName);
  }
  Future<Either<Failure,PlayerEntity>> getPlayerInfo({required int id})async{
    return await playersRepository.getPlayerInfo(id:id);
  }

  Future<Either<Failure,PlayerStatisticsEntity>> getPlayerStatistics(int id)async{
    return await playersRepository.getPlayerStatistics(id:id);
  }
  Future<Either<Failure,List<PlayerHistoryEntity>>> getPlayerHistory(int id)async{
    return await playersRepository.getPlayerHistory(id:id);
  }
  Future<Either<Failure,List<NewsEntity>>> getPlayerNews(int id)async{
    return await playersRepository.getPlayerNews(id:id);
  }
  Future<Either<Failure,PlayerNewStatisticsEntity>> getPlayerNewStatistics(int id,String? tournamentId,String? seasonId)async{
    return await playersRepository.getPlayerNewStatistics(id:id,tournamentId: tournamentId??"",seasonId: seasonId??"");
  }
}

