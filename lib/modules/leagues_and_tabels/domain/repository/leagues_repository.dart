import 'package:dartz/dartz.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_discipline_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_performance_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_top_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/table_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../../../news/domain/entity/news_entity.dart';
import '../entity/leagues_entity.dart';

abstract class LeaguesRepository{
  ///domain layer Repository Call Functions and return right and left
  /// right is the data return left is the failure


  Future<Either<Failure,List<LeagueEntity>>> getLeagues(int page);
  Future<Either<Failure,List<LeagueStageEntity>>> getTable(int id);
  Future<Either<Failure,List<NewsEntity>>> getLeagueNews({required int page,required int id});
  Future<Either<Failure,List<LeagueTopEntity>>> getLeagueTopScores(int id, String season);
  Future<Either<Failure,List<LeagueTopEntity>>> getLeagueTopAssists(int id, String season);
  Future<Either<Failure,List<LeagueDisciplineEntity>>> getLeagueDisciplines(int id, String season);
  Future<Either<Failure,List<LeaguePerformanceEntity>>> getLeaguePerformances(int id, String season);


}