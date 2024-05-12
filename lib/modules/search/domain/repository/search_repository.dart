import 'package:dartz/dartz.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/search_entity.dart';


abstract class SearchRepository{
  ///domain layer Repository Call Functions and return right and left
  /// right is the data return left is the failure

  Future<Either<Failure,SearchEntity>> getSearch({required String key,required String type});
}