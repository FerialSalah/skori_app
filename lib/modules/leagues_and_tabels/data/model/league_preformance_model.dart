import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';

import '../../domain/entity/league_performance_entity.dart';

class LeaguesPerformancesModel {
  LeaguesPerformancesModel({
    required this.data,
  });

  List<LeaguePerformanceModel> data;

  factory LeaguesPerformancesModel.fromJson(Map<String, dynamic> json) =>
      LeaguesPerformancesModel(
        data: json["data"] == null
            ? []
            : List<LeaguePerformanceModel>.from(
                json["data"]!.map((x) => LeaguePerformanceModel.fromJson(x))),
      );
}

class LeaguePerformanceModel extends LeaguePerformanceEntity {
  LeaguePerformanceModel(
      {required super.id,
      required super.tournamentLogo,
      required super.round,
      required super.type,
      required super.season,
      required super.homeTeamId,
      required super.homeTeamName,
      required super.homeTeamLogo,
      required super.awayTeamId,
      required super.awayTeamName,
      required super.awayTeamLogo,
      required super.homeTeamScore,
      required super.awayTeamScore,
      required super.totalScores,
      required super.stadium,
      required super.date,
      required super.time,
      required super.watchLink,
      required super.currentTime});

  factory LeaguePerformanceModel.fromJson(Map<String, dynamic> json) =>
      LeaguePerformanceModel(
          id: json['id'],
          tournamentLogo: json['tournament_logo'],
          round: json['round'],
          type: json['type'],
          season: json['season'],
          homeTeamId: json['home_team_id'],
          homeTeamName: json['home_team_name'],
          homeTeamLogo: json['home_team_logo'],
          awayTeamId: json['away_team_id'],
          awayTeamName: json['away_team_name'],
          awayTeamLogo: json['away_team_logo'],
          homeTeamScore: json['home_team_score'],
          awayTeamScore: json['away_team_score'],
          totalScores: json['total_scores'],
          stadium: json['stadium'],
          date: json['date'],
          time: json['time'],
          watchLink: json['watch_link'],
          currentTime: json['current_time']);
}
