import 'package:dartz/dartz.dart';
import 'package:skori/modules/nav_bar/domain/entity/home_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/match_entity.dart';

abstract class NavBarRepository{
  ///domain layer Repository Call Functions and return right and left right is the data return left is the failure
  ///
  //
  Future<Either<Failure,List<MatchEntity>>> getMatches({required int page,String? date,String? tournamentId,String? teamId,String? countryId,String? seasonId });
  Future<Either<Failure,HomeEntity>> getHome();

}