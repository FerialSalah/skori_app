import 'package:dartz/dartz.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/table_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/leagues_entity.dart';

abstract class LeaguesRepository{
  ///domain layer Repository Call Functions and return right and left
  /// right is the data return left is the failure


  Future<Either<Failure,List<LeagueEntity>>> getLeagues(int page);
  Future<Either<Failure,List<TableEntity>>> getTable(int id);

}