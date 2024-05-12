import 'package:skori/modules/matches/domain/entity/goals_no_entity.dart';

class GoalsNoModel extends GoalsNoEntity{
  GoalsNoModel({
    required super.name,
    required super.value
  });

  factory GoalsNoModel.fromJson(Map<String, dynamic> json) => GoalsNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']: ValueGoalsNoModel.fromJson(json['value'])

  );

}

class ValueGoalsNoModel extends GoalsValueEntity{
  ValueGoalsNoModel({
    required super.awayGoalsNo,
    required super.homeGoalsNo
  });
  factory ValueGoalsNoModel.fromJson(Map<String, dynamic> json) => ValueGoalsNoModel(
      awayGoalsNo: json["away_goals_no"],
      homeGoalsNo:json['home_goals_no']

  );
}