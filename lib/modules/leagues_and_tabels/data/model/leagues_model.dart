
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';


class LeaguesModel {
  LeaguesModel({
    required this.data,
  });

  List<LeagueModel> data;

  factory LeaguesModel.fromJson(Map<String, dynamic> json) => LeaguesModel(
    data: json["data"] == null ? [] : List<LeagueModel>.from(json["data"]!.map((x) => LeagueModel.fromJson(x))),
  );

}



class LeagueModel extends LeagueEntity {
  LeagueModel({
    required super.id,
    required super.title,
    required super.logo,
    required super.continent,
    required super.isFollow,
    required super.isFavorite, required super.season,
  });


  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
    id: json["id"],
    title: json["title"],
    logo: json["logo"],
    continent: json["continent_name"],
    season:  json["season"],
    isFollow: json["is_follow"],
    isFavorite: json["is_favorite"],

  );

}





