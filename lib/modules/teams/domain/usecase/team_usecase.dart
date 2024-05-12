import 'package:dartz/dartz.dart';
import 'package:skori/modules/teams/domain/entity/team_statistics_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../../../nav_bar/domain/entity/match_entity.dart';
import '../../../news/domain/entity/news_entity.dart';
import '../../../players/domain/entity/player_entity.dart';
import '../entity/team_entity.dart';
import '../repository/team_repository.dart';

class TeamsUseCase{
  final  TeamsRepository teamsRepository;

  TeamsUseCase(this.teamsRepository);

  Future<Either<Failure,List<TeamEntity>>> getTeams({required int page, String? teamName, String? tournamentId, String? countryId})async{
    return await teamsRepository.getTeams(page:page,teamName: teamName,tournamentId: tournamentId,countryId: countryId);
  }
  Future<Either<Failure,List<TeamEntity>>> getFilterTeams({ String? tournamentId})async{
    return await teamsRepository.getFilterTeams(tournamentId: tournamentId);
  }
  Future<Either<Failure,List<MatchEntity>>> getTeamMatches(int id)async{
    return await teamsRepository.getTeamMatches(id:id);
  }
  Future<Either<Failure,TeamStatisticsEntity>> getTeamStatistics(int id)async{
    return await teamsRepository.getTeamStatistics(id:id);
  }
  Future<Either<Failure,List<NewsEntity>>> getTeamNews(int id)async{
    return await teamsRepository.getTeamNews(id:id);
  }
  Future<Either<Failure,List<PlayerEntity>>> getTeamPlayers(int page,int id)async{
    return await teamsRepository.getTeamPlayers(id:id);
  }


}

