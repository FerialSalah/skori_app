import 'package:dartz/dartz.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/search_entity.dart';
import '../repository/search_repository.dart';

class SearchUseCase{
  final  SearchRepository searchRepository;
  SearchUseCase(this.searchRepository);


  Future<Either<Failure,SearchEntity>> getSearch({required String key,required String type})async{
    return await searchRepository.getSearch(key:key, type:type);
  }

}

