
import 'package:skori/modules/players/data/model/fifa_card_model.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/teams/data/model/team_model.dart';

class PlayersModel {
  PlayersModel({
    required this.data,
  });

  List<PlayerModel> data;

  factory PlayersModel.fromJson(Map<String, dynamic> json) => PlayersModel(
    data: json["data"] == null ? [] : List<PlayerModel>.from(json["data"]!.map((x) => PlayerModel.fromJson(x))),
  );

}



class PlayerModel extends PlayerEntity {
  PlayerModel({
    required super.id,
    required super.name,
    required super.avatar,
    required super.birthDate,
    required super.age,
    required super.gender,
    required super.weight,
    required super.height,
    required super.nationalShirtNumber,
    required super.countryName,
    required super.countryLogo,
    required super.clubShirtNumber,
    required super.position,
    required super.isFollow,
    required super.isFavourite,
     required super.teamEntity,
    required super.fifaCardEntity,
  });


  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
    birthDate: json["birth_date"]??"",
    age: json["age_years"],
    gender: json["gender"],
    weight: json["weight"]??"",
    height: json["height"]??"",
    nationalShirtNumber: json["national_shirt_no"]??"",
    countryName: json["country_name"],
    countryLogo: json["country_logo"],
    clubShirtNumber: json["club_shirt_no"],
    position: json["position"],
    isFollow: json["is_follow"],
    isFavourite: json["is_favorite"],
    teamEntity: json['team'] != null ?TeamModel.fromJson(json['team']):null,
    fifaCardEntity: FifaCardModel.fromJson(json['fifa_card'])

  );
}





