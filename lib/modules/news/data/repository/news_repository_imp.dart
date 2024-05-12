
import 'package:dartz/dartz.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';
import '../../domain/repository/news_repository.dart';
import '../datasource/news_datasource.dart';

class NewsRepositoryImp implements NewsRepository {
  final BaseNewsDataSource baseNewsDataSource;
  final NetworkChecker networkChecker;
  NewsRepositoryImp(this.baseNewsDataSource, this.networkChecker);


  @override
  Future<Either<Failure, List<NewsEntity>>> getNews({required int page,required String type}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseNewsDataSource.getNews(page: page,type: type);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }


  @override
  Future<Either<Failure,NewsEntity>> getNewsDetails({ int? playerId, int? teamId,required int articleId}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseNewsDataSource.getNewsDetails(articleId: articleId,playerId: playerId,teamId: teamId);
        return Right(result);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }




}