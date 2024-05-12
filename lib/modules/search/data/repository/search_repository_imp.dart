import 'package:dartz/dartz.dart';
import 'package:skori/modules/search/domain/entity/search_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';
import '../../domain/repository/search_repository.dart';
import '../datasource/search_datasource.dart';

class SearchRepositoryImp implements SearchRepository {
  final BaseSearchDataSource baseSearchDataSource;
  final NetworkChecker networkChecker;
  SearchRepositoryImp(this.baseSearchDataSource, this.networkChecker);

  @override
  Future<Either<Failure, SearchEntity>> getSearch({required String key,required String type}) async{
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseSearchDataSource.getSearch(key: key,type: type);
        return Right(result);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }


}