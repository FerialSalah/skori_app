import 'package:skori/modules/leagues_and_tabels/domain/entity/league_top_entity.dart';
import 'package:skori/modules/transfers/domain/entity/transfer_entity.dart';

class LeagueTopModel extends LeagueTopEntity {
  LeagueTopModel(
      {required super.teamId,
      required super.totalGoals,
      required super.playerId,
        super.totalAssists,
      super.player,
      super.team,
      super.totalMatches});
  factory LeagueTopModel.fromJson(Map<String, dynamic> json) =>
      LeagueTopModel(
          totalGoals : json['total_goals'],
          totalAssists: json['total_assists'],
          totalMatches : json['total_matches'],
          teamId : json['team_id'],
          playerId : json['player_id'],
          player : json['player'] != null ? new LeaguePlayerModel.fromJson(json['player']) : null,
          team : json['team'] != null ? new LeagueTeamModel.fromJson(json['team']) : null
      );

}

class LeaguePlayerModel extends LeaguePlayerEntity{
  LeaguePlayerModel({required super.id,super.avatar,super.clubShirtNo,super.country,super.name,
  super.nationalShirtNo,
  });
  factory LeaguePlayerModel.fromJson(Map<String, dynamic> json) =>
      LeaguePlayerModel(
        id: json['id'],
        avatar: json['avatar'],
        name: json['name'],
        clubShirtNo: json['club_shirt_no'],
        nationalShirtNo: json['national_shirt_no'],
          country :
          json['country'] != null ? new CountryModel.fromJson(json['country']) : null
        //country: json['country']!=null? CountryModel.fromJson(json['country']):null
      );
}

class CountryModel extends Country{
  CountryModel({required super.id, required super.name, required super.code, required super.key, required super.isDefault, required super.currency, required super.flag});
  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
      id: json['id'],
      code: json["code"] ?? "",
      currency: json['currency']??"",
      flag: json['flag'] ?? "",
      isDefault: json['is_default'] ,
      key: json['key'] ?? "",
      name: json['name'] ?? "");
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
