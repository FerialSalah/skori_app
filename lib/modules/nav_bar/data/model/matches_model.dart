import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';

class MatchesModel {
  MatchesModel({
    required this.data,
  });

  List<MatchModel> data;

  factory MatchesModel.fromJson(Map<String, dynamic> json) => MatchesModel(
        data: json["data"] == null
            ? []
            : List<MatchModel>.from(
                json["data"]!.map((x) => MatchModel.fromJson(x))),
      );
}

class MatchModel extends MatchEntity {
  MatchModel(
      {required super.tournamentLogo,
      required super.round,
      required super.type,
      required super.season,
      required super.homeTeamId,
      required super.awayTeamId,
      required super.id,
      required super.homeTeamScore,
      required super.awayTeamScore,
        required super.stadium,
      required super.homeTeamName,
      required super.awayTeamName,
      required super.logo,
      required super.homeTeamLogo,
      required super.awayTeamLogo,
      required super.time,
      required super.currentTime,
      required super.date,
      required super.watchLink});

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        id: json["id"],
        homeTeamLogo: json["home_team_logo"] ?? "",
        awayTeamLogo: json["away_team_logo"] ?? "",
        homeTeamName: json["home_team_name"],
        awayTeamName: json["away_team_name"],
        homeTeamScore: json["home_team_score"],
        awayTeamScore: json["away_team_score"],
        stadium: json["stadium"]?? "",
        logo: json["tournament_logo"],
        date: json["date"],
        time: json["time"],
        currentTime: json["current_time"]??"",
        tournamentLogo: json['tournament_logo'],
        round: json['round'],
        type: json['type'],
        season: json['season'],
        homeTeamId: json['home_team_id']??"",
        awayTeamId: json['away_team_id']??"",
        watchLink: json['watch_link']??"",
      );
}
