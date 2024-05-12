
import 'package:skori/modules/teams/domain/entity/team_entity.dart';

class TeamsModel {
  TeamsModel({
    required this.data,
  });

  List<TeamModel> data;

  factory TeamsModel.fromJson(Map<String, dynamic> json) => TeamsModel(
    data: json["data"] == null ? [] : List<TeamModel>.from(json["data"]!.map((x) => TeamModel.fromJson(x))),
  );

}



class TeamModel extends TeamEntity {
  TeamModel({
    required super.id,
    required super.name,
    required super.logo,
    required super.season,
    required super.country,
    required super.countryFlag,
    required super.isFollow,
    required super.isFavorites,
  });


  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    season: json["season"],
    country: json["country_name"],
    countryFlag: json["country_flag"],
    isFollow: json["is_follow"],
    isFavorites: json["is_favorite"],
  );
}





