import 'package:dartz/dartz.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/news_entity.dart';
import '../repository/news_repository.dart';

class NewsUseCase{
  final  NewsRepository newsRepository;

  NewsUseCase(this.newsRepository);

  Future<Either<Failure,List<NewsEntity>>> getNews({required int page,required String type})async{
    return await newsRepository.getNews(page:page,type: type);
  }
  Future<Either<Failure,NewsEntity>> getNewsDetails({ int? playerId, int? teamId,required int articleId})async{
    return await newsRepository.getNewsDetails(articleId: articleId,playerId: playerId,teamId: teamId);
  }

}

