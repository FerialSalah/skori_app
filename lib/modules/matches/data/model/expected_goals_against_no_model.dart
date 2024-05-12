import 'package:skori/modules/matches/domain/entity/expected_goals_aginst_no_entity.dart';

class ExpectedGoalsAgainstNoModel extends ExpectedGoalsAgainstNoEntity{
  ExpectedGoalsAgainstNoModel({
    required super.name,
    required super.value
  });

  factory ExpectedGoalsAgainstNoModel.fromJson(Map<String, dynamic> json) => ExpectedGoalsAgainstNoModel(
      name: json["name"],
      value:json['value'].toString()=="premium"||json['value']==null?json['value']:

      ExpectedGoalsAgainstNoValueModel.fromJson(json['value'])

  );

}

class ExpectedGoalsAgainstNoValueModel extends ExpectedGoalsAgainstNoValueEntity{
  ExpectedGoalsAgainstNoValueModel({
    required super.homeExpectedGoalsAgainstNo,
    required super.awayExpectedGoalsAgainstNo
  });
  factory ExpectedGoalsAgainstNoValueModel.fromJson(Map<String, dynamic> json) => ExpectedGoalsAgainstNoValueModel(
      awayExpectedGoalsAgainstNo: json["away_expected_goals_aginst_no"],
      homeExpectedGoalsAgainstNo:json['home_expected_goals_aginst_no']

  );
}