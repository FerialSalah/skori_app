import 'package:dartz/dartz.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_discipline_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_performance_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_top_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/table_entity.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/leagues_entity.dart';
import '../repository/leagues_repository.dart';

class LeaguesUseCase{
  final  LeaguesRepository leaguesRepository;

  LeaguesUseCase(this.leaguesRepository);

  Future<Either<Failure,List<LeagueEntity>>> getLeagues(int page)async{
    return await leaguesRepository.getLeagues(page);
  }

  Future<Either<Failure,List<LeagueStageEntity>>> getTable(int id)async{
    return await leaguesRepository.getTable(id);
  }

  Future<Either<Failure,List<NewsEntity>>> getLeagueNews(int page,int id)async{
    return await leaguesRepository.getLeagueNews(page: page,id:id);
  }
  Future<Either<Failure,List<LeagueTopEntity>>> getLeagueTopScores(int id, String seasonId)async{
    return await leaguesRepository.getLeagueTopScores(id,seasonId);
  }
  Future<Either<Failure,List<LeagueTopEntity>>> getLeagueTopAssists(int id, String seasonId)async{
    return await leaguesRepository.getLeagueTopAssists(id,seasonId);
  }
  Future<Either<Failure,List<LeagueDisciplineEntity>>> getLeagueDisciplines(int id, String seasonId)async{
    return await leaguesRepository.getLeagueDisciplines(id,seasonId);
  }
  Future<Either<Failure,List<LeaguePerformanceEntity>>> getLeaguePerformances(int id, String seasonId)async{
    return await leaguesRepository.getLeaguePerformances(id,seasonId);
  }
}

