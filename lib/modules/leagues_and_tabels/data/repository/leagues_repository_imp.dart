
import 'package:dartz/dartz.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/table_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';
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
  Future<Either<Failure, List<TableEntity>>> getTable(int id) async {
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



}