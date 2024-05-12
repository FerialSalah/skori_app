import 'package:skori/modules/matches/domain/entity/PassessionEntity.dart';

class PossessionModel extends PossessionEntity{
  PossessionModel({
   required super.name,
   required super.value
});

  factory PossessionModel.fromJson(Map<String, dynamic> json) => PossessionModel(
    name: json["name"],
    value:json["value"].toString()=="premium"||json["value"]==null?json["value"]: ValuePassessionModel.fromJson(json['value'])

  );

}

class ValuePassessionModel extends ValuePassessionEntity{
  ValuePassessionModel({
    required super.awayPossession,
    required super.homePossession
  });
  factory ValuePassessionModel.fromJson(Map<String, dynamic> json) => ValuePassessionModel(
      awayPossession: json["away_possession"],
      homePossession:json['home_possession']

  );
}