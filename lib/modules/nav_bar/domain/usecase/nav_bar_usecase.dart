
import 'package:dartz/dartz.dart';
import 'package:skori/modules/nav_bar/domain/entity/home_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../entity/match_entity.dart';
import '../repository/nav_bar_repository.dart';

class NavBarUseCase{
  final  NavBarRepository navBarRepository;

  NavBarUseCase(this.navBarRepository);

  Future<Either<Failure,List<MatchEntity>>> getMatches({required int page,String? date,String? tournamentId,String? teamId,String? countryId,String? seasonId})async{
    return await navBarRepository.getMatches(page:page,date: date??"",tournamentId: tournamentId??"",teamId: teamId??"",countryId:countryId??"",seasonId: seasonId??"");
  }

  Future<Either<Failure,HomeEntity>> getHome()async{
    return await navBarRepository.getHome();
  }


}

