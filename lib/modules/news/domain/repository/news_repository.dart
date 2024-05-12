import 'package:dartz/dartz.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/news_entity.dart';

abstract class NewsRepository{
  ///domain layer Repository Call Functions and return right and left
  /// right is the data return left is the failure


  Future<Either<Failure,List<NewsEntity>>> getNews({required int page,required String type});
  Future<Either<Failure,NewsEntity>>getNewsDetails({ int? playerId, int? teamId,required int articleId});

}