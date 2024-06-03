
import 'package:equatable/equatable.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';


class SearchEntity extends Equatable {
   // int teamResultsCount;
  List<TeamEntity> teamResults;
  // int playerResultsCount;
  List<PlayerEntity> playerResults;
  // int newResultsCount;
  List<NewsEntity> newResults;
   // int leaguesResultsCount;
   List<LeagueEntity> leaguesResults;
  SearchEntity(
   {
   // required this.teamResultsCount,
   required this.teamResults,
   // required this.playerResultsCount,
   required this.playerResults,
   // required this.newResultsCount,
   required this.newResults,
   // required this.leaguesResultsCount,
   required this.leaguesResults
   });
  @override
  List<Object?> get props => [];

}