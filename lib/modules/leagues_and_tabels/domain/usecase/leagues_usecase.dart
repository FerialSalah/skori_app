import 'package:dartz/dartz.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/table_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/leagues_entity.dart';
import '../repository/leagues_repository.dart';

class LeaguesUseCase{
  final  LeaguesRepository leaguesRepository;

  LeaguesUseCase(this.leaguesRepository);

  Future<Either<Failure,List<LeagueEntity>>> getLeagues(int page)async{
    return await leaguesRepository.getLeagues(page);
  }

  Future<Either<Failure,List<TableEntity>>> getTable(int id)async{
    return await leaguesRepository.getTable(id);
  }

}

