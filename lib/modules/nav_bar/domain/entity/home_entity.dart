
import 'package:equatable/equatable.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';

import '../../../teams/domain/entity/team_entity.dart';
import 'match_entity.dart';

class HomeEntity extends Equatable {

  final List<MatchEntity> liveMatches;
  final List<NewsEntity> latestNews;
  final List<NewsEntity> trendingNews;
  final List<TeamEntity> teams;
  final List<PlayerEntity> players;
  final List<LeagueEntity> tournaments;






  HomeEntity( {
    required this.liveMatches,
    required this.latestNews,
    required this.trendingNews,
    required this.teams,
    required this.players,
    required this.tournaments,


  });
  @override
  List<Object?> get props => [];

}