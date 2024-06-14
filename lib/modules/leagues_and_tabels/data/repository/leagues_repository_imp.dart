
import 'package:dartz/dartz.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_discipline_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_performance_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_top_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/table_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';
import '../../../news/domain/entity/news_entity.dart';
import '../../domain/repository/leagues_repository.dart';
import '../datasource/leagues_datasource.dart';

class LeaguesRepositoryImp implements LeaguesRepository {
  final BaseLeaguesDataSource baseLeaguesDataSource;
  final NetworkChecker networkChecker;
  LeaguesRepositoryImp(this.baseLeaguesDataSource, this.networkChecker);


  @override
  Future<Either<Failure, List<LeagueEntity>>> getLeagues(int page) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseLeaguesDataSource.getLeagues(page: page,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<LeagueStageEntity>>> getTable(int id) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseLeaguesDataSource.getTable(id: id,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getLeagueNews({required int page,required int id}) async{
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseLeaguesDataSource.getLeagueNews(page:page ,id: id,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<LeagueDisciplineEntity>>> getLeagueDisciplines(int id, String season) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseLeaguesDataSource.getLeagueStatisticsDiscipline(id: id, seasonId: season);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<LeaguePerformanceEntity>>> getLeaguePerformances(int id, String season) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseLeaguesDataSource.getLeagueStatisticsPerformance(id: id, seasonId: season);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<LeagueTopEntity>>> getLeagueTopAssists(int id, String season) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseLeaguesDataSource.getLeagueTopAssists(id: id, seasonId: season);
        return Right(result.data!);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    };
  }

  @override
  Future<Either<Failure, List<LeagueTopEntity>>> getLeagueTopScores(int id, String season) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseLeaguesDataSource.getLeagueTopScores(id: id, seasonId: season);
        return Right(result.data!);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    };
  }



}