import 'package:skori/modules/matches/domain/entity/own_goals_no_entity.dart';

class OwnGoalsNoModel extends OwnGoalsNoEntity{

  OwnGoalsNoModel({
    required super.name,
    required super.value
  });

  factory OwnGoalsNoModel.fromJson(Map<String, dynamic> json) => OwnGoalsNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

       OwnGoalsNoValueModel.fromJson(json['value'])

  );

}

class OwnGoalsNoValueModel extends OwnGoalsNoValueEntity{
  OwnGoalsNoValueModel({
    required super.homeOwnGoalsNo,
    required super.awayOwnGoalsNo
  });
  factory OwnGoalsNoValueModel.fromJson(Map<String, dynamic> json) => OwnGoalsNoValueModel(
      homeOwnGoalsNo: json["home_own_goals_no"],
      awayOwnGoalsNo:json['away_own_goals_no']

  );
}