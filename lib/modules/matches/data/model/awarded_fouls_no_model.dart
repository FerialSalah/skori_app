import 'package:skori/modules/matches/domain/entity/awarded_fouls_no_entity.dart';
import 'package:skori/modules/matches/domain/entity/crosses_open_play_no_entity.dart';

class AwardFoulsNoModel extends AwardFoulsNoEntity{
  AwardFoulsNoModel({
    required super.name,
    required super.value
  });

  factory AwardFoulsNoModel.fromJson(Map<String, dynamic> json) => AwardFoulsNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:
  AwardFoulsNoValueModel.fromJson(json['value'])

  );

}

class AwardFoulsNoValueModel extends AwardFoulsNoValueEntity{
  AwardFoulsNoValueModel({
    required super.awayAwardedFoulsNo,
    required super.homeAwardedFoulsNo
  });
  factory AwardFoulsNoValueModel.fromJson(Map<String, dynamic> json) => AwardFoulsNoValueModel(
      homeAwardedFoulsNo: json["home_awarded_fouls_no"],
      awayAwardedFoulsNo:json['away_awarded_fouls_no']

  );
}