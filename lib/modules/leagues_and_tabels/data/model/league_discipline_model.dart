import '../../domain/entity/league_discipline_entity.dart';

class LeagueDisciplinesModel {

  LeagueDisciplinesModel({
    required this.data,
  });

List<LeagueDisciplineModel>data;

  factory LeagueDisciplinesModel.fromJson(Map<String, dynamic> json) => LeagueDisciplinesModel(
    data: json["data"] == null ? [] : List<LeagueDisciplineModel>.from(
        json["data"]!.map((x) => LeagueDisciplineModel.fromJson(x))),
  );

}

class LeagueDisciplineModel extends LeagueDisciplineEntity {
  LeagueDisciplineModel(
      {required super.team,
      required super.matchesNo,
      required super.yellowCardsNo,
      required super.redCardsNo,
      required super.pointsNo});

  factory LeagueDisciplineModel.fromJson(Map<String, dynamic> json) =>
      LeagueDisciplineModel(
  team: json['team'] != null ? new LeagueTeamModel.fromJson(json['team']) : null,

  matchesNo : json['matches_no'],
  yellowCardsNo : json['yellow_cards_no'],
  redCardsNo : json['red_cards_no'],
  pointsNo : json['points_no']);
}

class LeagueTeamModel extends LeagueTeamEntity{
  LeagueTeamModel({required super.id, required super.name, required super.logo});
  factory LeagueTeamModel.fromJson(Map<String, dynamic> json) =>
      LeagueTeamModel(
          id : json['id'],
          name : json['name'],
          logo : json['logo'],
         );
}